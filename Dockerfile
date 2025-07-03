FROM python:3.13.4-alpine3.22 


#Define diretorio de trabalho dentro do conteiner
WORKDIR /app

#Copia arquivo de requerimento e instala as dependencias
#Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copia o restante do codigo da aplicação para o diretorio de trabalho
COPY . .

#Expoe a porta que a aplicação FastAPI ira rodar (padrao 8000)
EXPOSE 8000

#Comando para rodar a aplicação usando uvicorn
#O host 0.0.0.0 permite que a aplicação seja acessivel externamente ao conteiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
