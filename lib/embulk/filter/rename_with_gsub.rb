module Embulk
  module Filter
    class RenameWithGsub < FilterPlugin
      Plugin.register_filter("rename_with_gsub", self)

      def self.transaction(config, in_schema, &control)
        # configuration code:

        
        task = {
          "option1" => config.param("option1", :integer),                     # integer, required
          "option2" => config.param("option2", :string, default: "myvalue"),  # string, optional
          "option3" => config.param("option3", :string, default: nil),        # string, optional
        }

        columns = [
          Column.new(nil, "example", :string),
          Column.new(nil, "column", :long),
          Column.new(nil, "value", :double),
        ]

        out_columns = in_schema + columns

        yield(task, out_columns)
      end

      def init
        
      end

      def close
      end

      def add(page)
        # filtering code:
        page.each do |record|
          page_builder.add(record)
        end
      end

      def finish
        page_builder.finish
      end
    end

  end
end
