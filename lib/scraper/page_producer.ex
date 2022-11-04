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

    # If you want to use a fixed-size buffer, you also have the option to discard events
    # from the end of the queue when the :buffer_size limit is hit. Just pass the optional
    # :buffer_keep param and set it to :first (the default value is :last).
    {:producer, initial_state, buffer_size: 1, buffer_keep: :first}
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
