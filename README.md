# Miniprojet technique Sustaain

# Génération de l'image Docker de l'environnement


L'exécution de certaines parties de code est basée sur l'utilisation de LLMs open-source d'OpenAI. Leur utilisation requiert la présence d'un fichier `openai_api_key.txt` contenant un token d'accès OpenAI qui peut être créé [ici](https://platform.openai.com/api-keys) et placé dans le même dossier que ce fichier et le Dockerfile. Si l'utilisateur ne souhaite pas fournir un token OpenAI, il est tout de même requis de placer un fichier vide `openai_api_key.txt`.

Commencez par récupérer l'image de base contenant la librairie `unstructured` (qui est lourde, environ 20GB):

`docker pull downloads.unstructured.io/unstructured-io/unstructured:latest`

Vous pouvez ensuite construire l'image que nous utiliserons :

`docker build -t mpt_img .`

Démarrez ensuite un container exposant le port 8000 (utilisez-en un autre côté hôte s'il est déjà utilisé) :

`docker run -it -p 8000:8000 mpt_img`

Ce container lance un serveur Jupyter Lab qui peut être ouvert dans une navigateur Web à l'adresse `localhost:8000/` (modifier le port si nécessaire).

Si Jupyter vous demande de fournir un token d'authentification, vous pouvez le recopier dans l'output de la commande `docker run`, par exemple :

````
    To access the server, open this file in a browser:
        file:///home/notebook-user/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://0b18efe6b0b6:8000/lab?token=b1748de84f62f4394acf52447a70f125a310a5befd6c9237
        http://127.0.0.1:8000/lab?token=b1748de84f62f4394acf52447a70f125a310a5befd6c9237
````

Le token à fournir est alors `b1748de84f62f4394acf52447a70f125a310a5befd6c9237`.

# Exploration des notebooks de démonstration

Une fois connecté au serveur dans votre navigateur, vous pouvez explorer le dossier `notebooks` où vous trouverez les deux notebooks suivants :
- `explo_data.ipynb` : ce notebook contient une analyse de marché faite à l'aide des données fournies, ainsi que des discussions sur l'estimation des taux de rendement de production à court terme et sur l'intérêt d'investir dans la production ou la transformation (questions 1, 3, 4, 5)
- `process_pdf.ipynb` : ce notebook contient une démonstration d'un outil de lecture, structurartion et stockage de documents règlementaires au format PDF (question 2)

Ils peuvent normalement être exécutés sans erreur. Si vous n'avez pas fourni un token OpenAI valide, les cellules requérant l'usage de ce token ne fonctionneront pas.

Enfin, le fichier `analyse_explo_donnees.pdf` contient un ensemble de slides résumant l'analyse exploratoire des données de marché.