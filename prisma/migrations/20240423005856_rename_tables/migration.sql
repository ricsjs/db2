/*
  Warnings:

  - You are about to drop the `atividades` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `departamentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `funcionarios` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projetos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "atividades" DROP CONSTRAINT "atividades_projetoId_fkey";

-- DropForeignKey
ALTER TABLE "departamentos" DROP CONSTRAINT "departamentos_funcionarioCodigo_fkey";

-- DropForeignKey
ALTER TABLE "funcionarios" DROP CONSTRAINT "funcionarios_supervisorId_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_departamentoId_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_responsavelId_fkey";

-- DropTable
DROP TABLE "atividades";

-- DropTable
DROP TABLE "departamentos";

-- DropTable
DROP TABLE "funcionarios";

-- DropTable
DROP TABLE "projetos";

-- CreateTable
CREATE TABLE "Funcionario" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "dtNasc" TIMESTAMP(3) NOT NULL,
    "salario" DOUBLE PRECISION NOT NULL,
    "supervisorId" INTEGER,
    "departamentoId" INTEGER,
    "funcionarioCodigo" INTEGER,

    CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "Departamento" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sigla" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "gerenteId" INTEGER,
    "funcionarioCodigo" INTEGER,

    CONSTRAINT "Departamento_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "Projeto" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "responsavelId" INTEGER,
    "departamentoId" INTEGER,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFim" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Projeto_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "Atividade" (
    "codigo" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "projetoId" INTEGER,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFim" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Atividade_pkey" PRIMARY KEY ("codigo")
);

-- CreateIndex
CREATE UNIQUE INDEX "Departamento_sigla_key" ON "Departamento"("sigla");

-- CreateIndex
CREATE UNIQUE INDEX "Projeto_nome_key" ON "Projeto"("nome");

-- AddForeignKey
ALTER TABLE "Funcionario" ADD CONSTRAINT "Funcionario_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "Funcionario"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Departamento" ADD CONSTRAINT "Departamento_funcionarioCodigo_fkey" FOREIGN KEY ("funcionarioCodigo") REFERENCES "Funcionario"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projeto" ADD CONSTRAINT "Projeto_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "Funcionario"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projeto" ADD CONSTRAINT "Projeto_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES "Departamento"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atividade" ADD CONSTRAINT "Atividade_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "Projeto"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;
