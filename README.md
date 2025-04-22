# Simbrain 4.0 Docs

This is where documentation for Simbrain 4.0 will be developed. Changes can be made in the `src/docs` folder. All documentation is markdown and is compiled to html using https://just-the-docs.com/docs/utilities

# Set up

- Clone this project
- Install Docker Desktop 
  - If using webstorm on Mac enable socket sharing in Docker > settings > Allow the default Docker socket to be used 

# Run Locally
- Manually start Docker Desktop
- Run the container using `docker compose up -d --build` from this directory
- View page specified in docs > docker-compose.yml. 
  - It should be: `127.0.0.1:4000`
- Now you can make changes to markdown as you like in `src/docs`
- To stop use `docker compose down`

# Force Restart
- Run `docker compose down` followed by `docker compose up -d --build`

# Deployment

Commits are automatically deployed to https://docs.simbrain.net.

# Forking GitHub, Setting up VSCode, and Installing Docker

### 1. Fork the Repository
- Go to the Simbrain Docs GitHub page: [https://github.com/simbrain/simbraindocs](https://github.com/simbrain/simbraindocs)
- Create a **fork** of the repository under your own account.
- In your fork, click the green **“Code”** button.
- Under the **HTTPS** option, copy the provided URL.

### 2. Clone the Repository in VSCode
- Open **Visual Studio Code**.
- Open the **Source Control** tab (`Ctrl+Shift+G`) on the left sidebar.
- Click **“Clone Repository”** and paste the copied URL.
- Wait for the repository to clone.
- Open the **Explorer** tab (`Ctrl+Shift+E`) and ensure the folder contains `.github` and `src` folders.

### 3. Install the Docker Extension in VSCode
- Open the **Extensions** tab (`Ctrl+Shift+X`).
- Search for **“Docker”** in the marketplace.
- Install the Docker extension published by **Microsoft** (look for the blue checkmark).

### 4. Install Docker Desktop
- Visit: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
- Scroll past “Choose Plan” and hover over **“Download Docker Desktop”**.
- Choose your operating system and run the installer.
- You may need to create a Docker account — GitHub login works.

### 5. Start the Simbrain Docs Server
- Open **Docker Desktop**.
- In VSCode, you should now see a **Docker** icon in the Extensions tab.
- Under **Containers**, find `simbraindocs`.
- Click to expand, then right-click `simbraindocs-web` and click **Start**.
- Optionally, click **View Logs** to monitor the server startup.
- Once the server is running, right-click `simbraindocs-web` again and select **Open Browser**.
- This will launch the local Simbrain Docs server.
- Return to the **Explorer** tab in VSCode. Any changes made in `src/docs` will reflect in the local server.

---

# Editing Simbrain Docs in VSCode (After Setup)

1. Return to your personal fork of `simbraindocs` on GitHub.
2. Click **“Sync fork”** under the **Code** button to stay updated with the main repo.
3. In VSCode, open the **Source Control** tab and click **“Sync Changes”**.
4. You are now ready to begin editing the docs.

---

# Committing Changes, Pushing Changes, and Submitting a Pull Request

1. After making your edits, go to the **Source Control** tab.
2. You’ll see your changes listed — click **“Commit Changes”**.
3. In the new window, write a message describing your changes under the final hashtag (`#`) and click the **check mark** in the upper-right corner (“Accept Commit Message”).
4. Once the commit is saved, click **“Push Changes”**.
5. Go to your fork on GitHub, click **“Contribute”**, then **“Open Pull Request”**.
6. Change the title and description to reflect your edits and click **“Create Pull Request”**.

You have now submitted changes to the Simbrain Docs!
