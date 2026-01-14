# Simbrain 4.0 Docs

Documentation for Simbrain 4.0. Documentation is written in Markdown in the `src/docs` folder and compiled to HTML using [Just the Docs](https://just-the-docs.com/docs/utilities).

## Running Locally

Start Docker Desktop, then run:

```bash
docker compose up -d --build
```

The documentation will be available at `http://127.0.0.1:4000`. Changes to files in `src/docs` will be reflected automatically.

To stop the server:

```bash
docker compose down
```

## Deployment

Commits are automatically deployed to https://docs.simbrain.net.
