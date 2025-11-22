# Lume - Global Solution: DevOps e Cloud Computing

## Visão Geral do Projeto

Lume é um aplicativo mobile focado em promover a **saúde emocional** e o **bem-estar** dos usuários. O app permite o **registro diário de emoções**, oferece interação por **chat para suporte emocional** e possui uma **página de perfil** para acompanhamento do progresso.

***

## Objetivos

* Facilitar o **acompanhamento** da saúde emocional dos usuários.
* Permitir o **registro e análise** de padrões de emoções e bem-estar.
* Fornecer dados e métricas no **perfil** do usuário.
* Criar um **espaço seguro** para comunicação e suporte emocional.

***

## Tecnologias Utilizadas

O projeto é dividido em **Frontend (Mobile)** e **Backend (API)**.

### Frontend (Mobile)

* **React Native**: Framework principal para o desenvolvimento do aplicativo mobile.
* **Expo**: Plataforma para otimizar o desenvolvimento com React Native.
* **TypeScript**: Adiciona tipagem estática ao JavaScript para maior robustez.
* **Expo Router**: Utilizado para gerenciar a navegação entre as telas do app.
* **AsyncStorage**: Armazenamento local para dados persistentes no dispositivo.
* **Axios**: Cliente HTTP para realizar requisições à API do Backend.

### Backend (API)

* **Java Spring Boot**: Framework utilizado para o desenvolvimento da API REST.
* **Banco de Dados**: A arquitetura depende de um Banco de Dados, conforme especificado no repositório de backend.

***

## Telas Principais

O aplicativo conta com as seguintes telas:

1.  **Tela de Boas-vindas**: Tela inicial com o botão "Começar".
2.  **Tela de Login**: Interface para autenticação de usuários.
3.  **Tela de Registro**: Formulário para cadastro de novos usuários.
4.  **Tela de Check-in Emocional**: Permite o registro diário de emoções com visualização do histórico.
5.  **Tela de Chat**: Espaço para comunicação e suporte emocional.
6.  **Tela de Perfil**: Exibe informações, métricas e configurações do usuário.

***

## Estrutura de Deploy

A estrutura de deploy foi montada utilizando as seguintes tecnologias e provedor:

* **Virtualização**: Containers em **Docker**.
* **Provedor de Nuvem**: Máquina Virtual (VM) Debian no **Microsoft Azure**.
* **Root**: Utilização de tabelas SQL para persistência de dados.

***

## Diagrama de Arquitetura Macro

O diagrama abaixo ilustra a arquitetura geral do sistema Lume:

![Arquitetura Macro]()

***

## Testes de CRUD (SQL)

Abaixo estão os códigos SQL utilizados para testar as operações de **C**reate, **R**ead, **U**pdate e **D**elete (CRUD) no banco de dados do projeto.

```sql
INSERT INTO tb_usuario (nm, email, password, idade, nvl_de_estresse) 
VALUES ('Roberto Santos', 'roberto.s@app.net', 'roberto_hash_xpto', 51, 'Baixo');

INSERT INTO tb_checkin_emocional (dt_hr, nvl_emocional, usuario_id) 
VALUES ('2025-11-22 18:00:00', 'Ansioso', 20);

INSERT INTO tb_metricas (btm_cardiaco, temp, dt_hr, usuario_id) 
VALUES (95.0, 37.0, '2025-11-22 18:05:00', 20);

INSERT INTO tb_autenticacao (email, password, usuario_id) 
VALUES ('roberto.s@app.net', 'roberto_token_live', 20);

UPDATE tb_usuario SET nvl_de_estresse = 'Moderado' WHERE id = 20;

DELETE FROM tb_autenticacao WHERE usuario_id = 20;
DELETE FROM tb_checkin_emocional WHERE usuario_id = 20; 
DELETE FROM tb_metricas WHERE usuario_id = 20;

DELETE FROM tb_usuario WHERE id = 20;

SELECT * FROM tb_usuario;
SELECT * FROM tb_checkin_emocional;
SELECT * FROM tb_metricas;
SELECT * FROM tb_autenticacao;

SELECT COUNT(*) AS total_usuarios FROM tb_usuario; 
SELECT COUNT(*) AS total_metricas FROM tb_metricas;
SELECT COUNT(*) AS total_checkins FROM tb_checkin_emocional;
SELECT COUNT(*) AS total_autenticacoes FROM tb_autenticacao;
```
### Vídeo da demonstração do Crud
[![Vídeo do CRUD](https://img.youtube.com/vi/gU00VbxjbYc/hqdefault.jpg)](https://youtu.be/gU00VbxjbYc)

## Configuração da VM de Backend (Microsoft Azure)
O backend do Lume foi hospedado em uma Máquina Virtual (VM) no Microsoft Azure, utilizando a configuração B2s para um ótimo equilíbrio entre custo e desempenho. Esta VM é responsável por rodar o projeto Spring Boot dentro de um container Docker, garantindo ambiente controlado e alta disponibilidade.
Repositório do Backend (Java + Spring Boot) https://github.com/Wugabriel/LumeJava.git

### Comandos de Deploy na VM
```
# 1. Acessar a VM via SSH
ssh UserVm@IpDaVm

# 2. Atualizar pacotes
sudo apt update

# 3. Instalação do Docker e Git
sudo apt install git docker.io -y

# 4. Adicionar usuário ao grupo Docker (para evitar o uso de 'sudo' no Docker)
sudo usermod -aG docker ${USER}

# 5. Clonar o projeto backend
git clone [https://github.com/Wugabriel/LumeJava.git](https://github.com/Wugabriel/LumeJava.git)

# 6. Entrar no diretório do projeto
cd ~/LumeJava

# 7. Compilar o projeto e criar a imagem Docker
docker build -t lumejava-api .

# 8. Rodar o container, mapeando a porta 8080 e configurando reinício automático
docker run -d -p 8080:8080 --name lume-backend --restart always lumejava-api

# 9. Verificar se o container está ativo
docker ps

# 10. Monitorar os logs do container
docker logs lume-backend -f

# 11. Instalar o firewall (UFW)
sudo apt install ufw -y

# 12. Liberar porta SSH (22) e porta da aplicação (8080)
sudo ufw allow ssh
sudo ufw allow 8080/tcp

# 13. Ativar o firewall
sudo ufw enable

# 14. Checar o status do firewall
sudo ufw status
```
### Vídeo de demonstração da Vm 
[![Vídeo de demonstração](https://img.youtube.com/vi/JEIFXWpi3Uw/hqdefault.jpg)](https://youtu.be/JEIFXWpi3Uw)

***

## Integrantes

* Fábio Henrique de Souza Eduardo Rm:560416 
* Gabriel Wu Castro Rm:560210
* Renato Kenji Sugaki Rm:559810

