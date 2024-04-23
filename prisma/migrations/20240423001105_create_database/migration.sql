-- CreateTable
CREATE TABLE "funcionarios" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "dtNasc" TIMESTAMP(3) NOT NULL,
    "salario" DOUBLE PRECISION NOT NULL,
    "supervisorId" INTEGER,
    "departamentoId" INTEGER,
    "funcionarioCodigo" INTEGER,

    CONSTRAINT "funcionarios_pkey" PRIMARY KEY ("codigo")
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
ALTER TABLE "funcionarios" ADD CONSTRAINT "funcionarios_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Departamento" ADD CONSTRAINT "Departamento_funcionarioCodigo_fkey" FOREIGN KEY ("funcionarioCodigo") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projeto" ADD CONSTRAINT "Projeto_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projeto" ADD CONSTRAINT "Projeto_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES "Departamento"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atividade" ADD CONSTRAINT "Atividade_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "Projeto"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;
