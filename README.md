# Simbrain 4.0 Docs

This is where documentation for Simbrain 4.0 will be developed. Changes can be made in the `src/docs` folder. All documentation is markdown and is compiled to html using https://just-the-docs.com/docs/utilities

# Set up

- Clone this project
- Install Docker Desktop 
  - If using webstorm on Mac enable socket sharing in Docker > settings > Allow the default Docker socket to be used 

# Workflow
- Run docker with `docker-compose up -d --build` from this directory
- View page specified in docs > docker-compose.yml. That is: `127.0.0.1:4000`
- Now you can make changes to markdown as you like in `src/docs`
- To stop use `docker-compose down`
- To to restart first stop then use `docker-compose up -d --build` again
  -- You might have to restart after big changes to markdown files

# Deployment

Coming later