Node = Struct.new(:value, :next, :prev)

class ListaDoble
  attr_accessor :head, :tail, :length

  def initialize(length)
    @head = nil
    @tail = nil
    @length = length
  end

  def get_head
    @head
  end
  def get_tail
    @tail
  end

  def push_nodo(nodo)
    #nodo = Node(nodo.value,nodo.next,nodo.prev)
    @head ||= nodo

    if @tail
      @tail.next = nodo
      nodo.prev = @tail
    end
    @tail = nodo
    @length+=1
  end
  def add_at_final(et)
    nodo = Node.new(et,nil,nil)    
    if self.empty
	nodo.next = nodo
	nodo.prev = nodo
	@head = nodo
	@tail = nodo
	@length+=1
    else
       nodo.prev = @tail
       nodo.next = nil
       @tail.next = nodo
       @tail = nodo
       @length+=1   
    end
  end  
def empty
    if @head == nil
      true
    else
      false
    end
  end

 def add_at_begin(nodo)
    if @head.nil?
      @head = nodo
      @length+=1
    else
      @head.prev = nodo
      nodo.next = @head
      @head = nodo
      @length+=1
    end
  end

  def extraer_begino
    if @head == nil
      return nil
    else
      current_node = @head
      @head = @head.next
      @head.prev = nil
      current_node.next = nil
      @length-=1
      return current_node
    end
  end
  def extraer_begin
    if @tail.nil?
      return nil
    elsif @tail == @head
      @tail = nil
      @head = nil
    else 
 	aux = @tail
 	@tail = aux.prev
	@tail.next = nil
	@length-=1
	return aux
    end
  end
  def insert_after(nodo1,nodo2)
    if @head.nil?
      @head=nodo1
      @head.next = nodo2
      nodo2.prev = @head
      @tail = nodo2
    else
      current_node = @head
      while current_node != nil
        if current_node.value == nodo1.value
          current_node.next.prev(nodo2)
          nodo2.next(current_node.next)
          current_node.next(nodo2)
          nodo2.prev(current_node)
        else
          current_node = current_node.next
        end
      end
  end
  end

  def delete_nodo(nodo)
    current_node = @head
    if current_node.value == nodo.value
      @head = @head.next
      @head.prev(nil)
      current_node.next(nil)
      return current_node
    else
      while current_node != nil
        current_node = current_node.next
        if current_node.value == nodo.value
          current_node.prev.next(current_node.next)
          current_node.next.prev(current_node.prev)
          current_node.next(nil)
          current_node.prev(nil)
          return current_node
        end
      end
    end
  end

  def print
    current_node = @head
    while !(current_node.nil?)
      puts current_node.value.nombre_etiqueta.to_s
      current_node = current_node.next
    end
  end

  def clasificacion

    lista1 = []
    lista2 = []

    current_node = @head
    while(!current_node.nil?)
	if current_node.value.sal < 6
	lista1.append(current_node.value.sal)
	else
	lista2.append(current_node.value.sal)
	end
	current_node = current_node.next
     end
     puts "Lista con valores de la sal menores que 6 :#{lista1}"
     puts "Lista con valores de la sal mayores que 6 :#{lista2}" 
  end

  def clasf_imc

    lista1 = []
    lista2 = []
    lista3 = []
    lista4 = []

    current_node = @head
    while(!current_node.nil?)
      case current_node.value.data.imc
      when 5.0...18.5
        lista1.append(current_node.value.nombre)
      when 18.5...25.0
        lista2.append(current_node.value.nombre)
      when 25.0...30.0
        lista3.append(current_node.value.nombre)
      when 30.0..50.0
        lista4.append(current_node.value.nombre)
      end
      current_node = current_node.next
    end
    puts "Personas con insuficiencia ponderal :#{lista1}"
    puts "Personas con un intervalo normal :#{lista2}"
    puts "Personas con sobrepeso : #{lista3}"
    puts "Personas con obesidad: #{lista4}"
  end

end
