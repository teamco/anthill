class CreateLanguages < ActiveRecord::Migration
    def change
        create_table :languages do |t|
            t.integer :item_id
            #-------------------------------------------------------------------------------
            #-- May be used to declare the natural language of the document. May be used by
            #-- robots to categorize by language. The corresponding Accept-Language header
            #-- (sent by a browser) causes a server to select an appropriate natural language
            #-- document. E.g.
            #-- <META HTTP-EQUIV="Content-Language" CONTENT="en-GB"> or (HTTP header)
            #-- Content-language: en-GB
            #-- languages are specified as the pair (language-dialect); here, English-British
            t.string :lang_dialect
            #-------------------------------------------------------------------------------
            t.string :short_name, :limit => 2
            t.string :alignment, :limit => 20, :default => "left"
            t.string :direction, :limit => 3, :default => "ltr"
            t.string :char_set, :limit => 100, :default => "utf-8"
        end

        add_index :languages, :item_id
    end
end
