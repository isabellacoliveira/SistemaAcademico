// Importa componentes do express 
import {Router} from 'express'; 
// Importa TesteController 
import TesteController from './controllers/TesteController'; 
// Importar ProdutoController
import ValidaTeste1 from './middlewares/ValidaTeste1';
import ProvasController from './controllers/ProvasController';
const Roteador = Router(); 

Roteador.get(     
    '/teste/:id',    
    ValidaTeste1,   
    new TesteController().teste1 
); 

Roteador.get('/provas', new ProvasController().index); 
Roteador.get('/provas/:id', new ProvasController().show); 
Roteador.post('/provas', new ProvasController().store); 
Roteador.put('/provas/:id', new ProvasController().update); 
Roteador.delete('/provas/:id', new ProvasController().delete);

export default Roteador;