-- CreateTable
CREATE TABLE `fornecedores` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(20) NOT NULL,
    `cnpj` DECIMAL(65, 30) NOT NULL,
    `createdAt` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `fornecedores_cnpj_key`(`cnpj`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `podutos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `preco` DECIMAL(12, 2) NOT NULL,
    `createdAt` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `categoriaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categorias` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cursos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `descricao` VARCHAR(2000) NOT NULL,
    `professorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `professores` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `lattes` VARCHAR(100) NOT NULL,
    `telefone` VARCHAR(30) NOT NULL,
    `email` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `salaaulas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` VARCHAR(50) NOT NULL,
    `temProjetor` BOOLEAN NOT NULL,
    `bloco` VARCHAR(30) NOT NULL,
    `quantidadeCadeiras` INTEGER NOT NULL,
    `quantidadeComputadores` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `disciplinas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `ementa` VARCHAR(500) NOT NULL,
    `cargaHoraria` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `itembibliografias` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` VARCHAR(20) NOT NULL,
    `autores` VARCHAR(200) NOT NULL,
    `titulo` VARCHAR(100) NOT NULL,
    `isbn` VARCHAR(50) NULL,
    `disciplinaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `materialidaticos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeArquivoOriginal` VARCHAR(100) NOT NULL,
    `nomeArquivoInterno` VARCHAR(100) NOT NULL,
    `autores` VARCHAR(200) NOT NULL,
    `disciplinaId` INTEGER NOT NULL,

    UNIQUE INDEX `materialidaticos_nomeArquivoInterno_key`(`nomeArquivoInterno`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alunos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `cursoId` INTEGER NOT NULL,
    `telefone` VARCHAR(30) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `dataNascimento` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `semestres` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(50) NOT NULL,
    `sigla` VARCHAR(5) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `itemcalendarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `periodoDe` DATE NOT NULL,
    `periodoAte` DATE NOT NULL,
    `descricao` VARCHAR(100) NOT NULL,
    `haveraAula` BOOLEAN NOT NULL,
    `semestreId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `turmas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cursoId` INTEGER NOT NULL,
    `salaAulaId` INTEGER NOT NULL,
    `professorId` INTEGER NOT NULL,
    `disciplinaId` INTEGER NOT NULL,
    `semestreId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alunoturmas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `turmaId` INTEGER NOT NULL,
    `alunoId` INTEGER NOT NULL,

    UNIQUE INDEX `alunoturmas_turmaId_alunoId_key`(`turmaId`, `alunoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `aulas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `conteudoProgramatico` VARCHAR(200) NOT NULL,
    `dataProgramada` DATE NOT NULL,
    `tecnicaMetodologica` VARCHAR(100) NOT NULL,
    `turmaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `provas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dataProgramada` DATE NOT NULL,
    `tipo` VARCHAR(30) NOT NULL,
    `peso` INTEGER NOT NULL,
    `turmaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `chamadas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `alunoTurmaId` INTEGER NOT NULL,
    `aulaId` INTEGER NOT NULL,
    `presente` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `alunoTurmaId` INTEGER NOT NULL,
    `provaId` INTEGER NOT NULL,
    `nota` DECIMAL(3, 1) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_FornecedoresToProduto` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_FornecedoresToProduto_AB_unique`(`A`, `B`),
    INDEX `_FornecedoresToProduto_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `podutos` ADD CONSTRAINT `podutos_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categorias`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cursos` ADD CONSTRAINT `cursos_professorId_fkey` FOREIGN KEY (`professorId`) REFERENCES `professores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `itembibliografias` ADD CONSTRAINT `itembibliografias_disciplinaId_fkey` FOREIGN KEY (`disciplinaId`) REFERENCES `disciplinas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `materialidaticos` ADD CONSTRAINT `materialidaticos_disciplinaId_fkey` FOREIGN KEY (`disciplinaId`) REFERENCES `disciplinas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alunos` ADD CONSTRAINT `alunos_cursoId_fkey` FOREIGN KEY (`cursoId`) REFERENCES `cursos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `itemcalendarios` ADD CONSTRAINT `itemcalendarios_semestreId_fkey` FOREIGN KEY (`semestreId`) REFERENCES `semestres`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turmas` ADD CONSTRAINT `turmas_cursoId_fkey` FOREIGN KEY (`cursoId`) REFERENCES `cursos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turmas` ADD CONSTRAINT `turmas_salaAulaId_fkey` FOREIGN KEY (`salaAulaId`) REFERENCES `salaaulas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turmas` ADD CONSTRAINT `turmas_professorId_fkey` FOREIGN KEY (`professorId`) REFERENCES `professores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turmas` ADD CONSTRAINT `turmas_disciplinaId_fkey` FOREIGN KEY (`disciplinaId`) REFERENCES `disciplinas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turmas` ADD CONSTRAINT `turmas_semestreId_fkey` FOREIGN KEY (`semestreId`) REFERENCES `semestres`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alunoturmas` ADD CONSTRAINT `alunoturmas_turmaId_fkey` FOREIGN KEY (`turmaId`) REFERENCES `turmas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alunoturmas` ADD CONSTRAINT `alunoturmas_alunoId_fkey` FOREIGN KEY (`alunoId`) REFERENCES `alunos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aulas` ADD CONSTRAINT `aulas_turmaId_fkey` FOREIGN KEY (`turmaId`) REFERENCES `turmas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `provas` ADD CONSTRAINT `provas_turmaId_fkey` FOREIGN KEY (`turmaId`) REFERENCES `turmas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `chamadas` ADD CONSTRAINT `chamadas_alunoTurmaId_fkey` FOREIGN KEY (`alunoTurmaId`) REFERENCES `alunoturmas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `chamadas` ADD CONSTRAINT `chamadas_aulaId_fkey` FOREIGN KEY (`aulaId`) REFERENCES `aulas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notas` ADD CONSTRAINT `notas_alunoTurmaId_fkey` FOREIGN KEY (`alunoTurmaId`) REFERENCES `alunoturmas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notas` ADD CONSTRAINT `notas_provaId_fkey` FOREIGN KEY (`provaId`) REFERENCES `provas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FornecedoresToProduto` ADD CONSTRAINT `_FornecedoresToProduto_A_fkey` FOREIGN KEY (`A`) REFERENCES `fornecedores`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FornecedoresToProduto` ADD CONSTRAINT `_FornecedoresToProduto_B_fkey` FOREIGN KEY (`B`) REFERENCES `podutos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
