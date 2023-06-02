// importa o express 
import express from 'express';
import cors from 'cors';
// importar rotas 
import Roteador from './routes';

// instancia o express 
const app = express();

app.use(cors());
// Configurar uso json
app.use(express.json());
// Configuração de uso das rotas
app.use(Roteador); 
//configura porta e funçao executada na ativação 
app.listen(4000, ()=>{console.log("Servidor Iniciado")}  );
