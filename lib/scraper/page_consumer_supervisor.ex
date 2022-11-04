defmodule PageConsumerSupervisor do
  use ConsumerSupervisor
  require Logger

  def start_link(_args) do
    ConsumerSupervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("PageConsumerSupervisor init")

    children = [
      %{
        id: PageConsumer,
        start: {PageConsumer, :start_link, []},
        # Mandatory. Only support :temporary or :transient
        restart: :transient
      }
    ]

    opts = [
      strategy: :one_for_one,
      subscribe_to: [
        # 2 consumers at most could run concurrently.
        # You could use System.schedulers_online() * 2 to adjust
        # the performance according to your system resources
        {OnlinePageProducerConsumer, max_demand: 2}
      ]
    ]

    ConsumerSupervisor.init(children, opts)
  end
end
