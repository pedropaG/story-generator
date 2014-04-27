module Editor
module StoriesHelper
  
  def lorem_ipsum
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque tincidunt quam id justo laoreet mollis. Suspendisse ligula augue, molestie at dolor ut, vehicula aliquet arcu. Nunc at sem dui. Aliquam eget sem gravida, porttitor sapien eget, tempor turpis. Cras non adipiscing sapien, at elementum nisi. Quisque ut magna lacus. Maecenas laoreet, justo non cursus sollicitudin, est leo lobortis erat, et adipiscing ante quam vel libero. Sed ac augue cursus, eleifend libero at, consequat sapien."
  end
  
  def node(klass="", style="", tape_rotation="", id="1")
    "<div id='node_#{id}' class='node #{klass}' style='#{style}'> \
      <div class='content'> \
        <div class='tape' style='-webkit-transform: rotate(#{tape_rotation}deg) skew(0,0) translate(0%,-5px)'></div> \
        <div class='paper'></div> \
        <p>#{lorem_ipsum}</p> \
        <div class='actions_node'> <a href='#' class='edit_node button_node'></a> <a href='#' class='destroy_node button_node'></a> \
        </div> \
      </div> \
    </div>"
  end
end
  
end