class Factory
      def self.new(*args, &block)
        new_class=Class.new
        args.each do |var|
          new_class.class_eval { attr_accessor var  }
          new_class.class_eval {@@attrs=args}
          end
        new_class.class_eval(&block) if block_given?
        create_initialize_for(new_class)
        create_index_for (new_class)
        new_class
      end

      private
      def self.create_initialize_for (new_class)
      new_class.class_eval do
        def initialize(*args)
          @@attrs.each_index { |i|
            instance_variable_set('@'+@@attrs[i].to_s, args[i])
          }
        end
       end
      end

     def self.create_index_for (new_class)
       new_class.class_eval do
         def [] (param)
           if param.is_a?(Fixnum)
             attr=@@attrs[param]
           else
             attr=param
           end
           self.send(attr)
         end
       end
     end

end