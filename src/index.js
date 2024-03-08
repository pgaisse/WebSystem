const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');
const multer = require('multer');

const { database } = require('./keys');

// Intializations
const app = express();
require('./lib/passport');

// Settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));

console.log(path.join(__dirname, 'js'));

app.engine('hbs', exphbs.engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: {ifCond: function(v1, v2, options) {
            console.log('1:'+ v1);
            console.log('2:'+v2);
            if(v1 === v2) { 
                return options.fn(this); 
            } 
            return options.inverse(this); 

        },
        rest: function(v1) {
          const result= v1-1;
          if (result >=1){
            return result;
          }
          else{
            return 1;
          }
          

      },
      setVar: function(varName, varValue, options) {
  options.data.root[varName] = varValue;
},
      sum: function(v1, max) {
        const result= v1+1;
        return result;

    },
    
    findTable: function(obj) {
      const id=0;
      for (var prop in obj){
        //if(prop.includes('id_'))
        {
          return prop;
        }
      }
    },
    findId: function(obj) {
      for (var prop in obj){
        //if(prop.includes('id_'))
        {
          return obj[prop];
        }
      }
    },
    icons: function(nameTable) {
      
      
        
          var icons=[['incidents','fas fa-exclamation-triangle'],['repairs','fas fa-hammer'],['advisers','fas fa-user'], ['cases','fas fa-folder-open'],['clients','fas fa-user-friends'],['budgets','far fa-clipboard'],['damages','fas fa-house-damage'],['sectors','fas fa-map-marker-alt'],['status','fas fa-check-circle']];
          //const objetoJSON = JSON.parse(icons);
          
         
          for (let i = 0; i < 9; i++) {
           if (icons[i][0]==nameTable)
            {
              return icons[i][1]
            }
          
          }
      
    },
    genField: function(type_f) { 
      let html_v='';
    
       console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+type_f);
      if(type_f=='varchar'){
        html_v= `<input type="text" name="adviser_name" placeholder="Name" class="form-control" >`;


      }
      else if('int'){
        html_v= `<input type="Number" name="adviser_name" placeholder="Name" class="form-control" >`;
      }
  return html_v;
  }      
  },
        
}))
app.set('view engine', '.hbs');

// Middlewares
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(multer({
  dest:'public/uploads'

}).single('image'));

app.use(session({
  secret: 'faztmysqlnodemysql',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
// Global variables
app.use((req, res, next) => {
  app.locals.message = req.flash('message');
  app.locals.success = req.flash('success');
  app.locals.user = req.user;
  next();
});

// Routes
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));
app.use('/links', require('./routes/links'));

// Public
app.use(express.static(path.join(__dirname, 'public/style-1')));
app.use(express.static(path.join(__dirname, 'js')));

// Starting
app.listen(app.get('port'), () => {
  console.log('Server is in port', app.get('port'));
});