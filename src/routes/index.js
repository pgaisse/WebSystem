const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isNLoggedIn, isAdmin} = require('../lib/auth');
const { log } = require('handlebars');




//const multer =require('multer');
let temp_view='';
let headerQuery1 =`SELECT cases.id_case, advisers.adviser_name,advisers.adviser_lastname, status.status_name,incidents.incident_code, DATE_FORMAT(cases.case_date, "%d/%l/%Y") case_date,
clients.client_name ,clients.client_lastname, clients.client_rut, clients.client_address, budgets_damages_sectors.damage_size as dms, 
budgets_damages_sectors.sector_w_size as sws, budgets_damages_sectors.sector_l_size as sls, budgets_damages_sectors.sector_h_size as shs `;




let headerQuery2 =`SELECT budgets_damages_sectors.id_budget_damage_sector as ids,cases.id_case,incidents.incident_code, damages.damage_name, sectors.sector_name, budgets_damages_sectors.damage_size as dms, 
budgets_damages_sectors.sector_w_size as sws, budgets_damages_sectors.sector_l_size as sls, budgets_damages_sectors.sector_h_size as shs,clients.client_name ,clients.client_lastname,
clients.client_rut, clients.client_address, advisers.adviser_name, advisers.adviser_lastname, damages_repairs.id_damage_repair, repairs.id_repair `;




router.get('/', async (req, res) => {
    res.render('index');
});



router.get('/myinsp',isLoggedIn, async (req, res) => {
    
    try{
       /* let query_my =`
        
	select status.status_name,count(c_d_s.id_sector)as nsectors ,cases.id_case,DATE_FORMAT(cases.case_date, "%d/%l/%Y") case_date, clients.client_name, clients.client_lastname, clients.client_address, clients.client_rut from c_d_s 
    inner join cases
    on cases.id_case=c_d_s.id_case
    inner join advisers
    on advisers.id_adviser=cases.id_adviser
    inner join status
    on status.id_status=cases.id_status
    inner join clients
    on clients.id_client=cases.id_client
    where advisers.id_adviser=${req.user.id_adviser}
    group by cases.id_case;`;
*/
let query_my =`
        
SELECT count(*) as nsectors, n.id_case , n.case_date,
n.client_name, n.client_lastname,n.client_address, n.client_rut,n.status_name

 from (select cs.id_sector,
cs.id_case id_case ,DATE_FORMAT(cases.case_date, "%d/%l/%Y") case_date,
clients.client_name as client_name, clients.client_lastname as client_lastname, clients.client_address as client_address, clients.client_rut as client_rut,status.status_name as status_name
from c_d_s  as cs
inner join cases
    on cases.id_case=cs.id_case
    inner join advisers
    on advisers.id_adviser=cases.id_adviser
    inner join status
    on status.id_status=cases.id_status
    inner join clients
    on clients.id_client=cases.id_client
    where advisers.id_adviser=${req.user.id_adviser}  group by cs.id_case,cs.id_sector
    )as n
    group by n.id_case;`;

        console.log("esta es la ctmm --------------"+query_my);
       
        const cases = await pool.query(query_my);
        res.render('myinsp',{cases});
    }
    catch(error){
        console.error('Error en la consulta:', error);

    }


    
});




const resultsPerPage = 10;


router.post('/cases',isAdmin, async (req, res) => {
    let sql = 'SELECT * FROM cases ';
    const tableName     = req.body.table_name;
    const searchresult   =   req.body.search_input;
    let searchField   =   req.body.search;
    if (searchField=='status_name'){searchField='id_status';}
    pool.query(sql,[req.user.id_adviser], (err, users) => {
        if(err) throw err;
        const numOfResults = users.length;
        const numberOfPages = Math.ceil(numOfResults / resultsPerPage);
        let page = req.query.page ? Number(req.query.page) : 1;
        if(page > numberOfPages){
            res.redirect('/?page='+encodeURIComponent(numberOfPages));
        }else if(page < 1){
            res.redirect('/?page='+encodeURIComponent('1'));
        }
        //Determine the SQL LIMIT starting number
        const startingLimit = (page - 1) * resultsPerPage;
        //Get the relevant number of POSTS for this starting page
        sql = `SELECT advisers.adviser_name ,advisers.adviser_lastname, cases.id_case, status.status_name, DATE_FORMAT(cases.case_date, "%d/%l/%Y") case_date,
        clients.client_name ,clients.client_lastname, clients.client_rut, clients.client_address, incidents.incident_code  FROM cases
        INNER JOIN cases_status
        ON cases_status.id_case=cases.id_case
        INNER JOIN status
        ON status.id_status=cases_status.id_status
        INNER JOIN budgets_damages_sectors
        ON budgets_damages_sectors.id_case=cases.id_case
        INNER JOIN incidents
        ON incidents.id_incident=budgets_damages_sectors.id_incident
        INNER JOIN budgets
        ON budgets.id_budget=budgets_damages_sectors.id_budget
        INNER JOIN advisers_budgets
        ON advisers_budgets.id_budget=budgets.id_budget
        INNER JOIN advisers
        ON advisers.id_adviser=advisers_budgets.id_adviser
        INNER JOIN clients_budgets
        ON clients_budgets.id_budget=budgets.id_budget
        INNER JOIN clients
        ON clients.id_client=clients_budgets.id_client
        WHERE ${tableName}.${searchField}='${searchresult}'
        ORDER BY status.id_status ASC
        LIMIT ${startingLimit},${resultsPerPage}`;
        pool.query(sql, (err, users)=>{
            if(err) throw err;
            let iterator = (page - 5) < 1 ? 1 : page - 5;
            let endingLink = (iterator + 9) <= numberOfPages ? (iterator + 9) : page + (numberOfPages - page);
            if(endingLink < (page + 4)){
                iterator -= (page + 4) - numberOfPages;
            }
            console.log(sql);
            console.log('useeeeeeeeeeeeeeeeeeeeeeeeeeeeeeers  '+users);
            if (users==''){
                console.log(searchField+' no encontrado');
            }
            else{
                const fields = Object.keys(users[0])
                res.render('cases', {cases:users, campos:fields ,page, iterator, endingLink, numberOfPages});
            }
            
            
        });
    });
});



router.get('/cases',isLoggedIn, async (req, res) => {
    let sql = 'SELECT * FROM cases ';
    const {searchField, searchreult}=req.body;
    console.log('resultados :                    '+searchField +'  '+ searchreult);
    pool.query(sql,[req.user.id_adviser], (err, users) => {
        if(err) throw err;
        const numOfResults = users.length;
        const numberOfPages = Math.ceil(numOfResults / resultsPerPage);
        let page = req.query.page ? Number(req.query.page) : 1;
        if(page > numberOfPages){
            res.redirect('/?page='+encodeURIComponent(numberOfPages));
        }else if(page < 1){
            res.redirect('/?page='+encodeURIComponent('1'));
        }
        //Determine the SQL LIMIT starting number
        const startingLimit = (page - 1) * resultsPerPage;
        //Get the relevant number of POSTS for this starting page
        sql = `SELECT advisers.adviser_name ,advisers.adviser_lastname, cases.id_case, status.status_name, DATE_FORMAT(cases.case_date, "%d/%l/%Y") case_date,
        clients.client_name ,clients.client_lastname, clients.client_rut, clients.client_address, incidents.incident_code  FROM cases
        INNER JOIN cases_status
        ON cases_status.id_case=cases.id_case
        INNER JOIN status
        ON status.id_status=cases_status.id_status
        INNER JOIN budgets_damages_sectors
        ON budgets_damages_sectors.id_case=cases.id_case
        INNER JOIN incidents
        ON incidents.id_incident=budgets_damages_sectors.id_incident
        INNER JOIN budgets
        ON budgets.id_budget=budgets_damages_sectors.id_budget
        INNER JOIN advisers_budgets
        ON advisers_budgets.id_budget=budgets.id_budget
        INNER JOIN advisers
        ON advisers.id_adviser=advisers_budgets.id_adviser
        INNER JOIN clients_budgets
        ON clients_budgets.id_budget=budgets.id_budget
        INNER JOIN clients
        ON clients.id_client=clients_budgets.id_client
        ORDER BY status.id_status ASC
        LIMIT ${startingLimit},${resultsPerPage}`;
        pool.query(sql, (err, users)=>{
            if(err) throw err;
            let iterator = (page - 5) < 1 ? 1 : page - 5;
            let endingLink = (iterator + 9) <= numberOfPages ? (iterator + 9) : page + (numberOfPages - page);
            if(endingLink < (page + 4)){
                iterator -= (page + 4) - numberOfPages;
            }

            //pool.query(sql2, (err, field) => {
                if(err) throw err;
                console.log(users);
                res.render('cases', {cases:users, campos:Object.keys(users[0]) ,page, iterator, endingLink, numberOfPages});

            //});
            
        });
    });
});

router.get('/registers',isAdmin, async (req,res)=>{
    const sql=`SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
    const tables = await pool.query(sql);
    tableName='advisers';
    const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
    const table = await pool.query(`SELECT * from ${tableName}`);
    res.render('registers',{tables,table,desc:desctable,tableName});
})


router.post('/registers', isAdmin, async(req,res)=>{
    const sql=`SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
    const tables = await pool.query(sql);
    tableName=req.body.table_name;
    const desctable = await pool.query(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
    const table = await pool.query(`SELECT * from ${tableName}`);

    res.render('registers',{tables, table,desc:desctable,tableName})
})



router.get('/edit',isLoggedIn, async(req, res)=>{
    try{
        const sql2=`Select  advisers.id_adviser,cases.id_case, sectors.sector_name, damages.damage_name, repairs.repair_unit as unit,budgets_damages_sectors.damage_size dms,
        budgets_damages_sectors.sector_w_size as sws, budgets_damages_sectors.sector_l_size as sls, budgets_damages_sectors.sector_h_size as shs, damages_repairs.id_damage_repair, repairs.id_repair  
        FROM cases
        INNER JOIN cases_status
        ON cases_status.id_case=cases.id_case
        
        INNER JOIN status
        ON status.id_status=cases_status.id_status
        
        INNER JOIN budgets_damages_sectors
        ON budgets_damages_sectors.id_case=cases.id_case
        
        INNER JOIN drs_bdss
        ON drs_bdss.id_budget_damage_sector=budgets_damages_sectors.id_budget_damage_sector
        
        
        INNER JOIN damages_repairs
        ON damages_repairs.id_damage_repair=drs_bdss.id_damage_repair
        
        INNER JOIN repairs
        ON repairs.id_repair=damages_repairs.id_repair
        
        INNER JOIN damages
        ON damages.id_damage=damages_repairs.id_damage
        
        INNER JOIN sectors
        ON sectors.id_sector=budgets_damages_sectors.id_sector
        
        
        INNER JOIN budgets
        ON budgets.id_budget=budgets_damages_sectors.id_budget
        
        INNER JOIN advisers_budgets
        ON advisers_budgets.id_budget=budgets.id_budget
        
        INNER JOIN advisers
        ON advisers.id_adviser=advisers_budgets.id_adviser
        
        where cases.id_case=${req.query.id_case} AND advisers.id_adviser=${req.user.id_adviser}`;
        
        //console.log("ACTION REPAIRS++++++++++++++++++++++++++++++++++++"+sql2)
    
        const action_repairs = await pool.query(sql2);
        
        res.render('edit/index',{action_repairs});
    }
    catch(error){
        console.log(error);

    }


});

router.get('/sectors',isLoggedIn, async(req, res)=>{
     // (select count(id_damage) from c_d_s where id_case=cs.id_case and id_sector=cs.id_sector) as ndamages 
    try{
        let sql2=`SELECT
 
        cs.id_case,s.sector_name, count(cs.id_damage) as ndamages,s.id_sector,d.sector_w_size,d.sector_h_size,d.sector_l_size,d.damage_size,
        clients.client_name as client_name, clients.client_lastname as client_lastname, clients.client_address as client_address, clients.client_rut as client_rut
      


        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join sectors s
        on s.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case

        inner join incidents
        on incidents.id_incident=c.id_incident


        where cs.id_case=${req.query.id_case} AND a.id_adviser=${req.user.id_adviser}
group by s.sector_name,s.id_sector,d.sector_w_size,d.sector_h_size,d.sector_l_size,d.damage_size, cs.id_case; `;
        
        let vcase    =   req.query.id_case;
        console.log("ACTION REPAIRS++++++++++++++++++++++++++++++++++++"+sql2)
        const action_repairs = await pool.query(sql2);
       
        
        res.render('sectors/index',{action_repairs, vcase, client_data:{vaddress:action_repairs[0]['client_address'],vname:action_repairs[0]['client_name'], vlastname:action_repairs[0]['client_lastname']}});
    }
    catch(error){
        console.log(error);

    }


});

router.get('/damages',isLoggedIn, async(req, res)=>{
    try{ 
        sql1="Select damage_name, damage_unit, id_damage from damages"; 
        sql3="Select damage_unit from damages group by damage_unit"; 
        let sql2=`      
        SELECT     
        damages.damage_name, damages.damage_description,a.id_adviser, c.id_case, sectors.sector_name, sectors.id_sector,
        si.size as damage_size, damages.damage_unit

        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join sectors
        on sectors.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case
        
        inner join incidents
        on incidents.id_incident=c.id_incident
        inner join d_c_d_s si
        on si.id_c_d_s=cs.id_c_d_s


        where cs.id_case=${req.query.id_case} and a.id_adviser=${req.user.id_adviser} and cs.id_sector=${req.query.id_sector};`;
    
        const vcase    =   req.query.id_case;
        const defaultDamages = await pool.query(sql1);
        const damages = await pool.query(sql2);
        const defaultDamageunits  = await pool.query(sql3);
        const id_case=req.query.id_case;
        const id_sector=req.query.id_sector;

        
        res.render('damages/index',{damages, vcase,sname:damages[0]['sector_name'],defaultDamages,defaultDamageunits,id_case,id_sector});
    }
    catch(error){
        console.log(error);

    }


});

router.post('/damages', isLoggedIn,async (req,res)=>{
    
    try{ 
        const id_case=req.body.id_case;
        const id_sector=req.body.id_sector;
        insert1=`CALL dataInsert(${req.body.id_sector},${req.body.id_damage},${req.body.damage_size},${req.body.id_case});`
        console.log("dsssssssssssssssssssssssssssssssssssssssss :"+ req.file.path);
        const in1  = await pool.query(insert1);

        sql1="Select damage_name, id_damage  from damages"; 
        sql3="Select damage_unit from damages group by damage_unit"; 
        let sql2=` 
        SELECT     
        damages.damage_name, damages.damage_description,a.id_adviser, c.id_case, sectors.sector_name, sectors.id_sector,
        si.size as damage_size, damages.damage_unit

        from cases c
        inner join advisers a
        on a.id_adviser=c.id_adviser

        inner join clients
        on clients.id_client=c.id_client

        inner join status
        on status.id_status=c.id_status

        inner join c_d_s as cs
        on cs.id_case=c.id_case

        inner join damages
        on damages.id_damage=cs.id_damage

        inner join sectors
        on sectors.id_sector=cs.id_sector

        inner join dimentions d
        on d.id_sector=cs.id_sector and d.id_case=c.id_case
        
        inner join incidents
        on incidents.id_incident=c.id_incident
        inner join d_c_d_s si
        on si.id_c_d_s=cs.id_c_d_s


        where cs.id_case=${req.body.id_case} and a.id_adviser=${req.user.id_adviser} and cs.id_sector=${req.body.id_sector};`;
        console.log("CONSOLA Y LA CTM : "+req.query.id_case);
        const vcase    =   req.query.id_case;
        const defaultDamages = await pool.query(sql1);
        const damages = await pool.query(sql2);
        const defaultDamageunits  = await pool.query(sql3);
        
        res.render('damages/index',{damages, vcase,sname:damages[0]['sector_name'],defaultDamages,defaultDamageunits,id_case,id_sector});
    }
    catch(error){
        console.log(error);

    }
})

module.exports = router;
