module ApplicationHelper
            def display_favorite( favorite )
              if favorite
                render "favorites/favored"
                

              else
                render "favorites/unfavored"
                link_to 
                
              end
            end

end
