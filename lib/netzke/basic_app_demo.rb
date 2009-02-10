module Netzke
  class BasicAppDemo < BasicApp
    #
    # Specify the menus
    #
    def self.js_initial_menus
      [{
          :text => "Go to",
          :menu => {
            :items => [{
              :text => "Clerks",
              :handler => "this.appLoadWidget".l,
              :widget => 'clerks',
              :scope => this
            },{
              :text => "Bosses",
              :handler => "this.appLoadWidget".l,
              :widget => 'bosses',
              :scope => this
            }]
          }
        },{
          :text => "Administration",
          :menu => {
            :items => [{
              :text => "Users",
              :handler => "this.appLoadWidget".l,
              :widget => 'users',
              :scope => this
            }]
          }
        }] + super
    end
    
    #
    # Here are the widgets that our application will be able to load dynamically (see the demo for Netzke::GridPanel)
    #
    def initial_late_aggregatees
      {
        :clerks => {
          :widget_class_name => "BorderLayoutPanel",
          :ext_config => {
            :title => false
          },
          :regions => {
            :center => {
              :widget_class_name => "GridPanel", 
              :data_class_name => "Clerk", 
              :ext_config => {
                :title => 'Clerks',
                :rows_per_page => 20,
                :config_tool => true
              }
            },
            :south => {
              :widget_class_name => "Panel",
              :region_config => {
                :height => 150,
                :split => true
              },
              :ext_config => {
                :title => false,
                :body_style => "padding: 5px",
                :html => %Q{
What you see is a BorderLayoutPanel-based compound widget, containing a GridPanel interfacing the Clerks data, and a Panel with a little explanation (the one you are reading). <br>What is here to play with: <br>1) Do some on-the-fly configuration of the grid - move around or resize its columns, change something in the columns configuration panel (click the tool-button in the up-right corner), and then log out and again in - you'll see that your changes got stored; <br>2) Change the size of this region - it'll get stored for you as well, by to the BorderLayoutPanel widget. <br>The same explanation naturally applies to the <a href="#bosses">bosses</a> view.
}
              }
            }
          }
        },

        :bosses => {
          :widget_class_name => "BorderLayoutPanel",
          :ext_config => {
            :title => false
          },
          :regions => {
            :center => {
              :widget_class_name => "GridPanel", 
              :data_class_name => "Boss", 
              :ext_config => {
                :title => "Bosses",
                :rows_per_page => 20,
                :config_tool => true
              }
            },
            :south => {
              :widget_class_name => "Panel",
              :region_config => {
                :height => 50,
                :split => true
              },
              :ext_config => {
                :title => false,
                :body_style => "padding: 5px",
                :html => %Q{See the explanations for the <a href="#clerks">clerks</a> view.}
              }
            }
          }
        },

        :users => {
          :widget_class_name => "UserManager"
          # :data_class_name => "User", 
          # :ext_config => {
          #   :title => "Users"
          # },
          # :prohibit => :delete
        }
      }
    end
  end
end