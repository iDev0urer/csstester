module CSSTest
  class Agent

    def initialize
      @loader = CSSTest::Loader.new
      @json = @loader.load_data
    end

    def list
      list = []
      @json["agents"].each do |agent|
        list.push(agent[0])
      end
      list
    end

    def info(agent)
      agent_data = @json["agents"].select { |a|  a == agent }
      agent_data[agent]
    end

  end
end
