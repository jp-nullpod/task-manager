class Task
    attr_reader :id, :title, :description
    attr_accessor :done

    def initialize(attributes = {})
        @id = attributes[:id]
        @description =attributes[:description]
        @title = attributes[:title]
        @done = attributes[:done] || false
    end

    def save 
        if @id.nil?
            DB.execute("INSERT INTO tasks (title, description, done) VALUES(?,?,?)", @title, @description, @done ? 1:0)
            @id = DB.last_insert_row_id
        else 
            DB.execute("UPDATE tasks SET done= ? WHERE id = ?", 
                @done ? 1:0, @id)
        end
    end 

    def self.find(id)
        result = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
        result.nil? ? nil : build_task_object(result)
    end

    def self.all 
        results = DB.execute("SELECT * FROM tasks").map{ |result| 
            build_task_object(result)
        }
    end

    def destroy
        DB.execute("DELETE FROM tasks WHERE id = ?",@id)
    end

    private 
    
    def self.build_task_object(result) 
        Task.new(
            id: result["id"],
            title: result["title"],
            description: result["description"],
            done: result["done"] == 1
        )
    end
end