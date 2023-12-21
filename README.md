# whatsapp-chat-analysis
A streamlit app to analyze your whatsapp chats

For trying out the app go to https://whatsapp-chat-analysis-stream.herokuapp.com/

#For containerization 
Build image using
```
docker build -t chatanalysis .
```

Run the image using 
```
docker compose up --build 
```
or  for detached mode
```
docker compose up --build -d
```

to shutdown containers
```
docker compose down
```
