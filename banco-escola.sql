-- 1. Criar o Banco de Dados
CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

-- 2. Criar tabela de Professores
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    data_contratacao DATE
);

-- 3. Criar tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT
);

-- 4. Criar tabela de Alunos
CREATE TABLE Alunos (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(150)
);

-- 5. Criar tabela de Turmas (Tabela associativa com chaves estrangeiras)
CREATE TABLE Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(10) NOT NULL,
    ano_letivo INT NOT NULL,
    id_professor INT,
    id_disciplina INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- 6. Criar tabela de Alunos_Turmas (Relacionamento N:M entre Alunos e Turmas)
CREATE TABLE Alunos_Turmas (
    matricula INT,
    id_turma INT,
    PRIMARY KEY (matricula, id_turma),
    FOREIGN KEY (matricula) REFERENCES Alunos(matricula),
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);
