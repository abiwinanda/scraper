# Scraper

Sample data processing pipeline in elixir using GenStage.

## Setup

There are three branches in this repo:

1. `genstage`: Pipeline that consists out of genstage producer and consumer.
2. `genstage-consumer-supervisor`: Pipeline that consists out of genstage producer, consumer supervisor, and consumer.
3. `genstage-consumer-supervisor-with-registry`: Pipeline that consists out of multiple producer-consumer.

To run the app, install the required `:gen_stage` dependency

```sh
mix deps.get
```

next, run the app by running

```sh
iex -S mix
```

There is a `scrape/0` function provided in `.iex.exs` for you to trigger the scraping logic. No actual scraping is actually happening.

```sh
iex(1)> scrape.()
```
