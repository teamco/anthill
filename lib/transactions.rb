module Transactions
    # @param model [Model name]
    # @param params [Params hash]
    # @param logger [Boolean]
    def create_it(model, params, logger=false)
        model.transaction do
            item = Item.new
            @data = item.send("build_#{model.name.downcase}", params[model.name.downcase.to_sym])
            ap [@data, params[model.name.downcase.to_sym]] if logger
            begin
                item.save!
            rescue Exception => e
                ap ["Rollback on error", e]
            end
            if @data.id.nil?
                ap ["Rollback on validation", @data.errors]
                raise ActiveRecord::Rollback
            end
        end
        @data
    end

    def update_it

    end
end