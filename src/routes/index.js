const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isNLoggedIn, isAdmin} = require('../lib/auth');
const { log } = require('handlebars');
const sharp = require('sharp');


//const multer =require('multer');






router.get('/', async (req, res) => {
    try{
        res.render('index');
    }
    catch(error){
        res.render('index');
    }
    
});



router.get('/myinsp',isLoggedIn, async (req, res) => {    
    try{     
        const showCases=`SELECT 
        (SELECT COUNT(*) AS total_sectores
        FROM (
            SELECT cs2.id_sector
            FROM c_d_s cs2
            INNER JOIN cases c2 ON c2.id_case=cs2.id_case
            WHERE c2.id_adviser=${req.user.id_adviser} AND cs2.id_case=cs.id_case
            GROUP BY cs2.id_sector
        ) AS sectores_agrupados) as nsectors, 
        cs.id_case, 
        cases.case_date,
        clients.client_name, 
        clients.client_lastname,
        clients.client_address, 
        clients.client_rut,
        status.status_name
        from c_d_s  as cs
        inner join cases
        on cases.id_case=cs.id_case
        inner join advisers
        on advisers.id_adviser=cases.id_adviser
        inner join status
        on status.id_status=cases.id_status
        inner join clients
        on clients.id_client=cases.id_client
        where advisers.id_adviser=${req.user.id_adviser}
        group by cs.id_case;`;
        console.log(showCases);
        const results= await pool.query(showCases);
        const queryCases=results;
        res.render('myinsp',{cases:queryCases});
    }
    catch(error){
        
        req.flash('message', 'Ocurrió un error en la consulta');
        console.error('Error en la consulta:', error);
        res.redirect('myinsp');

    }    
});

router.post('/cases',isAdmin, async (req, res) => {
    try{
        const value         =   req.body.search_input;
        const  column       =   req.body.search;
        const table         =   column;
        const table2        =   table.split('_');
        let table3        ="";
        if (table.includes('id')){
            table3=table2[1];
            if (table3[table3.length-1]!='s'){
                table3=table3+'s';
            }
        }
        else {
            table3=table2[0];
            if (table3[table3.length-1]!='s'){
                table3=table3+'s';
            }
            
        }

        res.redirect(`/cases?table=${table3}&column=${column}&value=${value}`);
    }
    catch(error){
        req.flash('message', 'Ocurrió un error en la búsqueda');
        console.log(error)
        res.redirect('cases')

    }
    
});



router.get('/cases',isLoggedIn, async (req, res) => {
    try{
        const tablef            =   req.query.table;
        const column            =   req.query.column;
        const  value            =   req.query.value;
        let sql="";
        const statusColumns="Select status.status_name from status;";
        console.log(tablef+"        "+column+"           "+value);
        if (!tablef?.trim() || !column?.trim() || !value?.trim()) {
            sql=`call showAllCases("cases","id_case",'>',"0")`;
        }
        else {
            
            sql=`call showAllCases("${tablef}","${column}",'=',"${value}")`;
        }
        const [results]         =   await pool.query(sql);
        campos_en               =   Object.keys(results[0]);
        // this array must update each time that query is modify
        campos_sp               =   ['N° de caso','Estado de caso', 'Fecha de caso','N° asesor','Nombre de asesor','Apellido de asesor','Código de siniestro','Nombre de cliente','Apellido de cliente','Rut de cliente','Dirección del cliente'];
        //campos                  =   campos_sp.concat(campos_en);
        showAllCases            =   results;
        const statusResults     =   await pool.query(statusColumns);

        const campos = campos_sp.map((elem, index) => {
            return { campos_sp: elem, campos_en: campos_en[index] };
          });

        console.log(campos)
        res.render('cases', {cases:showAllCases, campos, statusFields:statusResults});     
    }
    catch(error){
        console.log(error)
        req.flash('message', 'Ocurrió un error en casos');
        res.redirect('cases')

    }

});

router.get('/registers',isAdmin, async (req,res)=>{
    try{
        const sql=`SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
    const tables = await pool.query(sql);
    tableName='advisers';
    const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
    const table = await pool.query(`SELECT * from ${tableName}`);
    res.render('registers',{tables,table,desc:desctable,tableName});

    }
    catch(error){
        req.flash('message', 'Ocurrió un error');
        console.log(error)
        res.redirect('/')
    }
    
})


router.post('/registers', isAdmin, async(req,res)=>{
    try{
        const sql=`SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
        const tables = await pool.query(sql);
        tableName=req.body.table_name;
        const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
        const table = await pool.query(`SELECT * from ${tableName}`);

        res.render('registers',{tables, table,desc:desctable,tableName})
    }
    catch(error){
        console.log(error)
        res.redirect('/')
    }
})



router.get('/edit',isLoggedIn, async(req, res)=>{
    try{
       
        
        res.render('edit/index');
    }
    catch(error){
        console.log(error);

    }


});

router.get('/sectors',isLoggedIn, async(req, res)=>{
    try{
        let action_repairs;
        let rowSectors='';
        let querySelect="";
        let string="";
        let vcase    =   req.query.id_case;

            const showSectors=`call showSectors(${req.user.id_adviser},${req.query.id_case})`;       
            
            
            
            const [results] = await pool.query(showSectors);
            
            console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa "+JSON.stringify(results,null,2)+"              ultimo: ");
            
            const resultsSectors=results;
            action_repairs =resultsSectors;

            
            if (results.length>0){
                querySelect=`SELECT id_sector, sector_name FROM sectors WHERE id_sector <> ${results[0]['id_sector']}`;
                for(let i=1;i<results.length;i++){
                    string= string+ " and id_sector <> "+ results[i]['id_sector'];
                }
                querySelect=querySelect+string+";";
                rowSectors= await pool.query(querySelect);
            }
    

   
        
        res.render('sectors/index',{action_repairs, rowSectors,vcase, client_data:{vaddress:action_repairs[0]['client_address'],vname:action_repairs[0]['client_name'], vlastname:action_repairs[0]['client_lastname']}});
    }
    catch(error){
        console.log(error);
        res.redirect(`/sectors?id_case=${req.query.id_case}`)

    }


});



router.post('/sectors',isLoggedIn, async(req, res)=>{
    // (select count(id_damage) from c_d_s where id_case=cs.id_case and id_sector=cs.id_sector) as ndamages 
   try{
       let string="";
    

       let fname1= req.files['image'] && req.files['image'].length > 0 ? req.files['image'][0]['filename'] : '';
       let fname2= req.files['image1'] && req.files['image1'].length > 0 ? req.files['image1'][0]['filename'] : '';

       
       let thumb1 =fname1? await sharp(req.files['image'][0]['path']).resize(120).toFile(req.files['image'][0]['destination']+`\\thumb_`+fname1, (err, info) => { console.log(err)}):'No ha subido imagen 1';
       let thumb2 =fname2? await sharp(req.files['image1'][0]['path']).resize(120).toFile(req.files['image1'][0]['destination']+`\\thumb_`+fname2, (err, info) => { console.log(err)}):'No ha subido imagen 2';
       


       console.log("aaaaaaa laa  ctmmm     :"+ "body: "+req.body.id_sector +"   query  : "+req.body.id_case );

       const queryInsert1       =   `insert into c_d_s (id_sector, id_case) values (${req.body.id_sector} ,${req.body.id_case});`;
       const queryInsert2       =   `insert into dimentions (id_case, id_sector, sector_w_size, sector_l_size, sector_h_size, img1, img2)
                                    values (${req.body.id_case}, ${req.body.id_sector}, ${req.body.sector_w_size},${req.body.sector_l_size},${req.body.sector_h_size},"${fname1}", "${fname2}")`;
       
       
       const insertSector       =   await pool.query(queryInsert1);
       const insertDimentions   =   await pool.query(queryInsert2);
       const  [getl_id]           =   await pool.query("SELECT max(id_c_d_s) m_id from c_d_s");
        console.log("estaaa es la wuea de get_iD"+getl_id['m_id']); 
       
       res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}&id_c_d_s=${getl_id['m_id']}`);
   }
   catch(error){
       console.log(error);
       req.flash('message', 'Ocurrió un error al ingresar un sector');
       res.redirect(`sectors?id_case=${req.body.id_case}`);

   }


});


router.get('/damages',isLoggedIn, async(req, res)=>{
    try{
        const id_case           =   req.query.id_case;
        const id_sector         =   req.query.id_sector;
        const id_c_d_s          =    req.query.id_c_d_s;
        const id_adviser        =   req.user.id_adviser;
        sql1                    =   "Select damage_name, damage_unit, id_damage from damages"; 
        sql3                    =   "Select damage_unit from damages group by damage_unit"; 
        let sql2                =   `call queryDamages(${id_sector},${id_adviser},${id_case });`;
        const vcase             =   id_case;
        [results1]              =   await pool.query(`Select sector_name from sectors where id_sector=${id_sector}`);
        sector_name             =   results1;
        const defaultDamages    =   await pool.query(sql1);
        const defaultDamageunits=   await pool.query(sql3);

        if (req.query.id_c_d_s){
            res.render('damages',{vcase,defaultDamages,defaultDamageunits,id_case,id_sector, sector_name,id_c_d_s});
        }
        else{
            
            const [results]     =   await pool.query(sql2);
            const damages       =   results;
    
                  
            res.render('damages',{damages, vcase,defaultDamages,defaultDamageunits,id_case,id_sector, sector_name});
        }
        
    }
    catch{
        console.log(error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
    
});

router.post('/damages', isLoggedIn,async (req,res)=>{
    
    try{ 
        const id_case=req.body.id_case;
        const id_sector=req.body.id_sector;
     
        let fname1= req.files['image'] && req.files['image'].length > 0 ? req.files['image'][0]['filename'] : '';
        let fname2= req.files['image1'] && req.files['image1'].length > 0 ? req.files['image1'][0]['filename'] : '';
        let fname3= req.files['image2'] && req.files['image2'].length > 0 ? req.files['image2'][0]['filename'] : '';

        console.log("ARCHIVOOOOOSS "+fname1+"         "+ fname2+ "        "+fname3);
        
        
        let thumb1 =fname1? await sharp(req.files['image'][0]['path']).resize(120).toFile(req.files['image'][0]['destination']+`\\thumb_`+fname1, (err, info) => { console.log(err)}):'No ha subido imagen 1';
        let thumb2 =fname2? await sharp(req.files['image1'][0]['path']).resize(120).toFile(req.files['image1'][0]['destination']+`\\thumb_`+fname2, (err, info) => { console.log(err)}):'No ha subido imagen 2';
        let thumb3 =fname3? await sharp(req.files['image2'][0]['path']).resize(120).toFile(req.files['image2'][0]['destination']+`\\thumb_`+fname3, (err, info) => { console.log(err)}):'No ha subido imagen 3';
        const id_c_d_s =req.body.id_c_d_s?req.body.id_c_d_s:0;
     console.log(`ARCHIVOOOOOSS  ${req.body.id_sector},${id_c_d_s},${req.body.id_damage},${req.body.damage_size},${req.body.id_case},"${fname1}","${fname2}","${fname3}"`);
        
        insert1=`CALL dataInsert(${req.body.id_sector},${id_c_d_s},${req.body.id_damage},${req.body.damage_size},${req.body.id_case},"${fname1}","${fname2}","${fname3}");`
        const in1  = await pool.query(insert1);
        res.redirect(`/damages/?id_case=${id_case}&id_sector=${id_sector}`); 
    }
    catch(error){
        console.log(error);
        req.flash('message', 'Ocurrió un error al agregar un daño');
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
})


router.get('/delreg',isLoggedIn,async(req,res)=>{
    try{
    const adviser= req.user.id_adviser;
    const id_case=req.query.id_case;
    const id_c_d_s=req.query.id_c_d_s;
    const id_damage_images=req.query.id_damage_images;
    const id_sector=req.query.id_sector;

    let del=`DELETE FROM c_d_s where id_c_d_s=${id_c_d_s} and id_case=(select cases.id_case from cases where cases.id_adviser=${adviser} and cases.id_case=${id_case})`;
    console.log(del)
    const query= await pool.query(del);

    console.log(query)
        res.redirect(`/damages/?id_case=${id_case}&id_sector=${id_sector}`);
    }
    catch{
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar');
        res.redirect(`/sectors/?id_case=${id_case}`);
    }

})


router.get('/delsector',isLoggedIn,async(req,res)=>{


    try{
        
        const delSector1=`delete from c_d_s where id_sector= ${req.query.id_sector} and id_case=${req.query.id_case}`;
        const delSector2=`delete from dimentions where id_sector = ${req.query.id_sector} and id_case=${req.query.id_case} `;
        result1= await pool.query(delSector1);
        result2= await pool.query(delSector2);
        req.flash('success', 'Dato Eliminado correctamente');
        res.redirect(`/sectors/?id_case=${req.query.id_case}`);
    }
    catch{
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar');
        res.redirect(`/sectors/?id_case=${req.query.id_case}`);

    }


})

module.exports = router;

