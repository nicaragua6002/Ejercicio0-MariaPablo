
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/09/2023 13:32:20
-- Generated from EDMX file: C:\Users\Estudiante\source\repos\Ejercicio0-MariaPablo\Datos\ColegioModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ColegioBD2023];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [User] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Rol] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Bitacoras'
CREATE TABLE [dbo].[Bitacoras] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [Accion] nvarchar(max)  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'Estudiantes'
CREATE TABLE [dbo].[Estudiantes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [FechaNac] nvarchar(max)  NOT NULL,
    [Carnet] nvarchar(max)  NOT NULL,
    [TutorId] int  NOT NULL
);
GO

-- Creating table 'Docentes'
CREATE TABLE [dbo].[Docentes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NombreCompleto] nvarchar(max)  NOT NULL,
    [INSS] nvarchar(max)  NOT NULL,
    [Salario] float  NOT NULL
);
GO

-- Creating table 'Tutores'
CREATE TABLE [dbo].[Tutores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NombreCompleto] nvarchar(max)  NOT NULL,
    [Telf] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cursos'
CREATE TABLE [dbo].[Cursos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Creditos] smallint  NOT NULL,
    [DocenteId] int  NOT NULL
);
GO

-- Creating table 'Calificaciones'
CREATE TABLE [dbo].[Calificaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Acumulado] float  NOT NULL,
    [Examen] float  NOT NULL,
    [CursoId] int  NOT NULL,
    [EstudianteId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Bitacoras'
ALTER TABLE [dbo].[Bitacoras]
ADD CONSTRAINT [PK_Bitacoras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [PK_Estudiantes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Docentes'
ALTER TABLE [dbo].[Docentes]
ADD CONSTRAINT [PK_Docentes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tutores'
ALTER TABLE [dbo].[Tutores]
ADD CONSTRAINT [PK_Tutores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cursos'
ALTER TABLE [dbo].[Cursos]
ADD CONSTRAINT [PK_Cursos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [PK_Calificaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'Bitacoras'
ALTER TABLE [dbo].[Bitacoras]
ADD CONSTRAINT [FK_UsuarioBitacora]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioBitacora'
CREATE INDEX [IX_FK_UsuarioBitacora]
ON [dbo].[Bitacoras]
    ([UsuarioId]);
GO

-- Creating foreign key on [TutorId] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [FK_TutorEstudiante]
    FOREIGN KEY ([TutorId])
    REFERENCES [dbo].[Tutores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorEstudiante'
CREATE INDEX [IX_FK_TutorEstudiante]
ON [dbo].[Estudiantes]
    ([TutorId]);
GO

-- Creating foreign key on [DocenteId] in table 'Cursos'
ALTER TABLE [dbo].[Cursos]
ADD CONSTRAINT [FK_DocenteCurso]
    FOREIGN KEY ([DocenteId])
    REFERENCES [dbo].[Docentes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocenteCurso'
CREATE INDEX [IX_FK_DocenteCurso]
ON [dbo].[Cursos]
    ([DocenteId]);
GO

-- Creating foreign key on [CursoId] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [FK_CursoCalificacion]
    FOREIGN KEY ([CursoId])
    REFERENCES [dbo].[Cursos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CursoCalificacion'
CREATE INDEX [IX_FK_CursoCalificacion]
ON [dbo].[Calificaciones]
    ([CursoId]);
GO

-- Creating foreign key on [EstudianteId] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [FK_EstudianteCalificacion]
    FOREIGN KEY ([EstudianteId])
    REFERENCES [dbo].[Estudiantes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstudianteCalificacion'
CREATE INDEX [IX_FK_EstudianteCalificacion]
ON [dbo].[Calificaciones]
    ([EstudianteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------