defmodule PageProducer do
  use GenStage
  require Logger

  def start_link(_args) do
    intial_state = []
    GenStage.start_link(__MODULE__, intial_state, name: __MODULE__)
  end

  @doc """
  Can be invoked to dispact event to consumer when needed.
  """
  def scrape_pages(pages) when is_list(pages) do
    GenStage.cast(__MODULE__, {:pages, pages})
  end

  def init(initial_state) do
    Logger.info("PageProducer init")

    {:producer, initial_state}
  end

  def handle_cast({:pages, pages}, state) do
    {:noreply, pages, state}
  end

  @doc """
  Only invoked when consumer is requesting for a demand.
  """
  def handle_demand(demand, state) do
    Logger.info("PageProducer received demand for #{demand} pages")
    events = []
    {:noreply, events, state}
  end
end
