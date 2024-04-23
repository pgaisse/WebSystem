const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isNLoggedIn, isAdmin } = require('../lib/auth');
const { log } = require('handlebars');
const sharp = require('sharp');
const pdfService = require('../lib/pdf');

//const multer =require('multer');






router.get('/', async (req, res) => {
    try {
        res.render('index');
    }
    catch (error) {
        res.render('index');
    }

});



router.get('/myinsp', isLoggedIn, async (req, res) => {
    try {
        const showCases = `
        select
        (SELECT COUNT(*) AS total_sectores
        FROM (
            SELECT cs2.id_sector
            FROM c_d_s cs2
            RIGHT JOIN cases c2 ON c2.id_case=cs2.id_case
            WHERE c2.id_adviser=${req.user.id_adviser} AND cs2.id_case=cs.id_case
            GROUP BY cs2.id_sector
        ) AS sectores_agrupados) as nsectors, 
	cases.id_case, 
    cases.img1,
    cases.img2,
        cases.case_date,
        clients.client_name, 
        clients.client_lastname,
        clients.client_address, 
        clients.client_rut,
        status.status_name
        from cases
        INNER join advisers
        on advisers.id_adviser=cases.id_adviser
        inner join status
        on status.id_status=cases.id_status
        inner join clients
        on clients.id_client=cases.id_client

	left join c_d_s  as cs
        on cs.id_case=cases.id_case
        where advisers.id_adviser=${req.user.id_adviser}

        group by cases.id_case;`;

        if(req.query.img && req.query.id_case ){
            const qupdate= `update cases set ${req.query.img}=NULL WHERE id_case=${req.query.id_case}` 
            const rqupdate= await pool.query(qupdate);
            console.log(qupdate)
        }
        else{
            console.log(req.query.img+"   "+ req.query.id_case )
        }
        
        const results = await pool.query(showCases);
        const queryCases = results;
        res.render('myinsp', { cases: queryCases });
    }
    catch (error) {

        req.flash('message', 'Ocurrió un error en la consulta ' + error);
        console.error('Error en la consulta:', error);
        res.redirect('myinsp');

    }
});

router.post('/myinsp', isLoggedIn, async (req, res) => {
    try{
        
        let fname1 = req.files['image'] && req.files['image'].length > 0 ? req.files['image'][0]['filename'] : '';
        let fname2 = req.files['image1'] && req.files['image1'].length > 0 ? req.files['image1'][0]['filename'] : '';


        let thumb1 = fname1 ? await sharp(req.files['image'][0]['path']).resize(120).toFile(req.files['image'][0]['destination'] + `\\thumb_` + fname1, (err, info) => { console.log(err) }) : 'No ha subido imagen 1';
        let thumb2 = fname2 ? await sharp(req.files['image1'][0]['path']).resize(120).toFile(req.files['image1'][0]['destination'] + `\\thumb_` + fname2, (err, info) => { console.log(err) }) : 'No ha subido imagen 2';

        const query= `update cases set img1= "${fname1}", img2="${fname2}" WHERE id_case=${req.body.id_case}`;
        console.log(query)
        resultQuery= await pool.query(query);
        const msg="Actualización de imagen exitosa. ";
        req.flash('success', msg);
        console.error(msg);
        res.redirect('myinsp');

    }
    catch(error){
        const msg="Ocurrió un error al actualizar las imagenes. ";
        req.flash('message', msg + error);
        console.error(msg, error);
        res.redirect('myinsp');
    }
});

router.post('/cases', isAdmin, async (req, res) => {
    try {
        const value = req.body.search_input;
        const column = req.body.search;
        const table = column;
        const table2 = table.split('_');
        let table3 = "";
        if (table.includes('id')) {
            table3 = table2[1];
            if (table3[table3.length - 1] != 's') {
                table3 = table3 + 's';
            }
        }
        else {
            table3 = table2[0];
            if (table3[table3.length - 1] != 's') {
                table3 = table3 + 's';
            }

        }

        res.redirect(`/cases?table=${table3}&column=${column}&value=${value}`);
    }
    catch (error) {
        req.flash('message', 'Ocurrió un error en la búsqueda');
        console.log(error)
        res.redirect('cases')

    }

});



router.get('/cases', isAdmin, async (req, res) => {
    try {
        const tablef = req.query.table;
        const column = req.query.column;
        const value = req.query.value;
        let sql = "";
        const statusColumns = "Select status.status_name from status;";
        if (!tablef?.trim() || !column?.trim() || !value?.trim()) {
            sql = `call showAllCases("cases","id_case",'>',"0")`;
        }
        else {

            sql = `call showAllCases("${tablef}","${column}",'=',"${value}")`;
        }
        const [results] = await pool.query(sql);
        campos_en = Object.keys(results[0]);
        // this array must update each time that query is modify
        campos_sp = ['N° de caso', 'Estado de caso', 'Fecha de caso', 'N° asesor', 'Nombre de asesor', 'Apellido de asesor', 'Código de siniestro', 'Nombre de cliente', 'Apellido de cliente', 'Rut de cliente', 'Dirección del cliente'];
        //campos                  =   campos_sp.concat(campos_en);
        showAllCases = results;
        const statusResults = await pool.query(statusColumns);

        const campos = campos_sp.map((elem, index) => {
            return { campos_sp: elem, campos_en: campos_en[index] };
        });

        res.render('cases', { cases: showAllCases, campos, statusFields: statusResults });
    }
    catch (error) {
        console.log(error)
        req.flash('message', 'Ocurrió un error en casos');
        res.redirect('cases')

    }

});

router.get('/registers', isAdmin, async (req, res) => {
    try {
        const sql = `SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
        const tables = await pool.query(sql);
        tableName = 'advisers';
        const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
        const table = await pool.query(`SELECT * from ${tableName}`);
        res.render('registers', { tables, table, desc: desctable, tableName });

    }
    catch (error) {
        req.flash('message', 'Ocurrió un error');
        console.log(error)
        res.redirect('/')
    }

})


router.post('/registers', isAdmin, async (req, res) => {
    try {
        const sql = `SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
        const tables = await pool.query(sql);
        tableName = req.body.table_name;
        const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
        const table = await pool.query(`SELECT * from ${tableName}`);
        res.render('registers', { tables, table, desc: desctable, tableName })
    }
    catch (error) {
        console.log(error)
        res.redirect('/')
    }
})



router.get('/edit', isLoggedIn, async (req, res) => {
    try {


        res.render('edit/index');
    }
    catch (error) {
        console.log(error);

    }


});

router.get('/sectors', isLoggedIn, async (req, res) => {
    try {
        let action_repairs;
        let rowSectors = '';
        let querySelect = "";
        let string = "";
        let vcase = req.query.id_case;

        const showSectors = `call showSectors(${req.user.id_adviser},${req.query.id_case})`;



        const [results] = await pool.query(showSectors);

        const resultsSectors = results;
        action_repairs = resultsSectors;

        if (results.length > 0) {
            if (results[0]['id_sector'] != "") {
                querySelect = `SELECT id_sector, sector_name FROM sectors WHERE id_sector <> ${results[0]['id_sector']}`;
                for (let i = 1; i < results.length; i++) {
                    string = string + " and id_sector <> " + results[i]['id_sector'];
                }
            }
            else {
                querySelect = `SELECT id_sector, sector_name FROM sectors`;
            }


            querySelect = querySelect + string + ";";
            rowSectors = await pool.query(querySelect);

        }



        res.render('sectors/index', { action_repairs, rowSectors, vcase, client_data: { vaddress: action_repairs[0]['client_address'], vname: action_repairs[0]['client_name'], vlastname: action_repairs[0]['client_lastname'] } });


    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al ingresar al caso');
        res.redirect(`/myinsp`)

    }


});



router.post('/sectors', isLoggedIn, async (req, res) => {
    // (select count(id_damage) from c_d_s where id_case=cs.id_case and id_sector=cs.id_sector) as ndamages 
    try {
        let string = "";


        let fname1 = req.files['image'] && req.files['image'].length > 0 ? req.files['image'][0]['filename'] : '';
        let fname2 = req.files['image1'] && req.files['image1'].length > 0 ? req.files['image1'][0]['filename'] : '';


        let thumb1 = fname1 ? await sharp(req.files['image'][0]['path']).resize(120).toFile(req.files['image'][0]['destination'] + `\\thumb_` + fname1, (err, info) => { console.log(err) }) : 'No ha subido imagen 1';
        let thumb2 = fname2 ? await sharp(req.files['image1'][0]['path']).resize(120).toFile(req.files['image1'][0]['destination'] + `\\thumb_` + fname2, (err, info) => { console.log(err) }) : 'No ha subido imagen 2';


        const queryInsert1 = `insert into c_d_s (id_sector, id_case) values (${req.body.id_sector} ,${req.body.id_case});`;
        const queryInsert2 = `insert into dimentions (id_case, id_sector, sector_w_size, sector_l_size, sector_h_size, img1, img2)
                                    values (${req.body.id_case}, ${req.body.id_sector}, ${req.body.sector_w_size},${req.body.sector_l_size},${req.body.sector_h_size},"${fname1}", "${fname2}")`;


        const insertSector = await pool.query(queryInsert1);
        const insertDimentions = await pool.query(queryInsert2);
        const [getl_id] = await pool.query("SELECT max(id_c_d_s) m_id from c_d_s");
        req.flash('success', 'Recinto agregado satisfactoriamente');
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}&id_c_d_s=${getl_id['m_id']}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al ingresar un sector ' + error);
        res.redirect(`sectors?id_case=${req.body.id_case}`);

    }


});


router.get('/damages', isLoggedIn, async (req, res) => {
    try {
        const id_case = req.query.id_case;
        const id_sector = req.query.id_sector;
        const id_c_d_s = req.query.id_c_d_s;
        const id_adviser = req.user.id_adviser;
        sql1 = "Select damage_name, damage_unit, id_damage from damages";
        sql3 = "Select damage_unit from damages group by damage_unit";
        sql4 = "Select id_repair, repair_name, repair_unit,  repair_price from repairs";
        let sql2 = `call queryDamages(${id_sector},${id_adviser},${id_case});`;
        const vcase = id_case;
        [results1] = await pool.query(`Select sector_name from sectors where id_sector=${id_sector}`);
        sector_name = results1;
        const defaultDamages = await pool.query(sql1);
        const defaultDamageunits = await pool.query(sql3);
        const defaultrepairs = await pool.query(sql4);

        if (req.query.id_c_d_s) {
            res.render('damages', { vcase, defaultDamages, defaultDamageunits, id_case, id_sector, sector_name, id_c_d_s, defaultrepairs });
        }
        else {

            const [results] = await pool.query(sql2);
            const damages = results;


            res.render('damages', { damages, vcase, defaultDamages, defaultDamageunits, id_case, id_sector, sector_name, defaultrepairs });
        }

    }
    catch {
        console.log(error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }

});

router.post('/damages', isLoggedIn, async (req, res) => {

    try {
        const id_case = req.body.id_case;
        const id_sector = req.body.id_sector;

        let fname1 = req.files['image'] && req.files['image'].length > 0 ? req.files['image'][0]['filename'] : '';
        let fname2 = req.files['image1'] && req.files['image1'].length > 0 ? req.files['image1'][0]['filename'] : '';
        let fname3 = req.files['image2'] && req.files['image2'].length > 0 ? req.files['image2'][0]['filename'] : '';



        let thumb1 = fname1 ? await sharp(req.files['image'][0]['path']).resize(120).toFile(req.files['image'][0]['destination'] + `\\thumb_` + fname1, (err, info) => { console.log(err) }) : 'No ha subido imagen 1';
        let thumb2 = fname2 ? await sharp(req.files['image1'][0]['path']).resize(120).toFile(req.files['image1'][0]['destination'] + `\\thumb_` + fname2, (err, info) => { console.log(err) }) : 'No ha subido imagen 2';
        let thumb3 = fname3 ? await sharp(req.files['image2'][0]['path']).resize(120).toFile(req.files['image2'][0]['destination'] + `\\thumb_` + fname3, (err, info) => { console.log(err) }) : 'No ha subido imagen 3';
        const id_c_d_s = req.body.id_c_d_s ? req.body.id_c_d_s : 0;

        insert1 = `CALL dataInsert(${req.body.id_sector},${id_c_d_s},${req.body.id_damage},${req.body.damage_size},${req.body.id_case},"${fname1}","${fname2}","${fname3}",${req.body.inlineRadioOptions});`
        const in1 = await pool.query(insert1);
        req.flash('success', 'Daño agregado satisfactoriamente');
        console.log(insert1)
        res.redirect(`/damages/?id_case=${id_case}&id_sector=${id_sector}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al agregar un daño ' + error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
})


router.post('/addDamageRepair', isLoggedIn, async (req, res) => {

    try {
        const id_case = req.body.id_case;
        const id_sector = req.body.id_sector;
        const id_repairs = req.body.id_repairs;
        const damage_name = req.body.damage_name;
        const damage_unit = req.body.damage_unit;
        const damage_desc = req.body.damage_desc;

        const id_repairs2 = id_repairs.join(',');
        console.log(JSON.stringify(id_repairs, null, 2) + "             v2  " + JSON.stringify(id_repairs2, null, 2))
        const query = `call addDamageRepair("${damage_name}","${damage_unit}","${damage_desc}","${id_repairs}","${req.user.adviser_name} ${req.user.adviser_lastname}")`;
        console.log(query)
        const q = pool.query(query)
        req.flash('success', 'El tipo de daño fue agregado satisfactoriamente');
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al agregar un tipo de daño ' + error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
})




router.get('/delreg', isLoggedIn, async (req, res) => {
    try {
        const adviser = req.user.id_adviser;
        const id_case = req.query.id_case;
        const id_c_d_s = req.query.id_c_d_s;
        const id_damage_images = req.query.id_damage_images;
        const id_sector = req.query.id_sector;

        let del = `DELETE FROM c_d_s where id_c_d_s=${id_c_d_s} and id_case=(select cases.id_case from cases where cases.id_adviser=${adviser} and cases.id_case=${id_case})`;
        const query = await pool.query(del);

        res.redirect(`/damages/?id_case=${id_case}&id_sector=${id_sector}`);
    }
    catch {
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar');
        res.redirect(`/sectors/?id_case=${id_case}`);
    }

})


router.get('/delsector', isLoggedIn, async (req, res) => {


    try {

        const delSector1 = `delete from c_d_s where id_sector= ${req.query.id_sector} and id_case=${req.query.id_case}`;
        const delSector2 = `delete from dimentions where id_sector = ${req.query.id_sector} and id_case=${req.query.id_case} `;
        result1 = await pool.query(delSector1);
        result2 = await pool.query(delSector2);
        req.flash('success', 'Dato Eliminado correctamente');
        res.redirect(`/sectors/?id_case=${req.query.id_case}`);
    }
    catch {
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar');
        res.redirect(`/sectors/?id_case=${req.query.id_case}`);

    }


})


router.get('/cases_crud', isAdmin, async (req, res) => {
    try {
        const id_case = req.query.id_case;
        const id_admin = req.user.id_adviser;
        const query = `call showCase(${id_case}, ${id_admin})`;
        let qdamage = `call queryDamages2(${req.user.id_adviser},${id_case});`;
        const showSectors = `call showSectors(${req.user.id_adviser},${req.query.id_case})`;
        const qadvisers = "select id_adviser, adviser_name, adviser_lastname from advisers";
        const qstatus = "select id_status, status_name from status";
        [results] = await pool.query(query);
        const [rowdamages] = await pool.query(qdamage);
        rowsQuery = results;
        const rowAdvisers = await pool.query(qadvisers);
        const rowStatus = await pool.query(qstatus);
        const [resSector] = await pool.query(showSectors);

        const groupedData = {};


        rowdamages.forEach(damage => {
            const sectorName = damage.sector_name;
            if (!groupedData[sectorName]) {
                groupedData[sectorName] = [];
            }
            groupedData[sectorName].push(damage);
        });

        // Crea un nuevo array con los sectores y sus daños asociados
        const organizedData = Object.keys(groupedData).map(sectorName => {
            return {
                sector_name: sectorName,
                damages: groupedData[sectorName]
            };
        });
        console.log(JSON.stringify(rowsQuery, null, 2));
        res.render('cases_crud', { data: rowsQuery, data2: rowAdvisers, data3: rowStatus, rowSectors: resSector, rowDamages: organizedData });

    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al cargar el caso');
        res.redirect(`/cases`);
    }



})

router.post('/cases_crud', isAdmin, async (req, res) => {
    try {

        const queryupad = `update cases set id_adviser=${req.body.id_adviser} WHERE id_case=${req.body.id_case}`;
        const queryupst = `update cases set id_status=${req.body.id_status} WHERE id_case=${req.body.id_case}`;


        const exead = req.body.id_adviser && !req.body.id_status ? await pool.query(queryupad) : await pool.query(queryupst);

        res.redirect(`/cases_crud/?id_case=${req.body.id_case}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al cargar el caso  ' + error);
        res.redirect(`/cases`);

    }



})


router.get('/createPdf', isAdmin, async(req, res) => {
    
    try{
        const id_case = req.query.id_case;
        const query= `call budget(${req.user.id_adviser},${id_case})`
        const query2 = `call showCase(${id_case}, ${req.user.id_adviser})`;
        console.log(query)
        const [data]= await pool.query(query);
        const [header_b]= await pool.query(query2);
        console.log(JSON.stringify(header_b,null,2))
        //const data=[{nombre: "patricio", apellido:"Gaisse"}];
        const stream = res.writeHead(200, {
            'Content-Type': 'application/pdf',
            'Content-Disposition': `attachment;filename=invoice.pdf`,
          });
          pdfService.buildPDF(
            (chunk) => stream.write(chunk),
            () => stream.end(), header_b
          );
    }
    catch(error){
        console.log(error)

    }
})

module.exports = router;

/*shift alt f  ordenar código
ctrl l seleccionar linea
ctrl d seleccionar coincidencia
shift alt selección por columna
ctrl f2 buscar coincidencias
*/