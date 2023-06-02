import {Request, Response} from 'express'; 
import {PrismaClient} from '@prisma/client';
import { parseISO } from 'date-fns';

class ProvasController {    
    
    async index(req:Request,res:Response)
    {        
        const prisma = new PrismaClient();        
        const provas = await prisma.prova.findMany(
            {
                orderBy:{dataProgramada:'asc'},
                // where:{id: Number(req.params.id)},                
                select:{      
                    id: true,              
                    dataProgramada:true,
                    tipo:true,                    
                    peso:true,                    
                    turmaId:true,                    
                    // turmaId:{                        
                    //     select:{id: true}
                    // }
                }
            }               
        ); 
        console.log(provas)
        res.status(200).json(provas);    
    }

    async show(req:Request,res:Response)
    {        
        const prisma = new PrismaClient();        
        const prova = await prisma.prova.findUnique( 
            {                
                where:{id: Number(req.params.id)},                
                select:{
                    id:true,
                    dataProgramada:true,
                    tipo:true,
                    peso:true
                }    
            }         
        );        
        res.status(200).json(prova);    
    }


    async store(req: Request, res: Response) {
      const prisma = new PrismaClient();
      const dados = req.body;
    
      // Extrair as propriedades relevantes do objeto `dados`
      const { dataProgramada, tipo, peso, turmaId } = dados;
    
      // Criar a nova prova
      const novaProva = await prisma.prova.create({
        data: {
          dataProgramada: parseISO(dataProgramada), // Converter a string para o formato desejado
          tipo,
          peso,
          turma: {
            connect: { id: turmaId } // Conectar a prova à turma existente pelo ID
          }
        },
        select: {
          id: true,
          dataProgramada: true,
          tipo: true,
          peso: true
        }
      });
    
      res.status(200).json(novaProva);
    }
    

    async update(req:Request,res:Response)
    {
        const prisma = new PrismaClient();        
        const provaId = Number(req.params.id);
        const dados = req.body;  
        const { dataProgramada, tipo, peso } = dados;
        const provaAlterada = await prisma.prova.update({
            where: { id: provaId },
            data: {
              dataProgramada: parseISO(dataProgramada), // Converter a string para o formato desejado
              tipo,
              peso
            },
            select: {
              id: true,
              dataProgramada: true,
              tipo: true,
              peso: true
            }
          });
          res.status(200).json(provaAlterada);
      
        // const provaAlterada = await prisma.prova.update(            
        //     {                
        //         where: {id: Number(req.params.id) },                
        //         data: req.body,                
        //         select: {                    
        //             id:true,                    
        //             dataProgramada:true,                    
        //             tipo:true,
        //             peso:true                
        //         }            
        //     }        
        // );        
        // res.status(200).json(provaAlterada);    
    }

    async delete(req:Request,res:Response)
    {        
        const prisma = new PrismaClient();        
        await prisma.prova.delete(            
            {                
                where: {id: Number(req.params.id) }            
            }        
        );        
        res.status(200).json({excluido: true});    
    }
}

export default ProvasController