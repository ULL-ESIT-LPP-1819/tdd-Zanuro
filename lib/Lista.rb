Node = Struct.new(:value, :next, :prev)

class ListaDoble
  include Comparable,Enumerable

  attr_accessor :head, :tail, :length

  def initialize(length)
    @head = nil
    @tail = nil
    @length = length
  end
  
  def <=>(otro)
      @head.value <=> otro.head.value
  end	
  def each
      a = @head
      while(!a.nil?)
      yield a.value
      a=a.next
      end
  end
 
 def ordernar_con_for
     a = @head
     lista_ordenada=[a.value]
     
     for i in (1..@length-1)
	a=a.next
	for j in (0...i)
		if(lista_ordenada[j]>=a.value)
		   lista_ordenada.insert(j,a.value)
		   break
		elsif(lista_ordenada[lista_ordenada.size-1] <= a.value)
		      lista_ordenada.push(a.value)
		      break
		end
	end
     end
     return lista_ordenada
end

def ordenar_con_each
	a=@head
	lista_ord=[a.value]
	j=0
	i=0
	self[1..@length-1].each do |x|
  	    lista_ord[j..i].each do |y|
   
  	      if(x<=y)
    		lista_ord.insert(j,x)
    		break

  	      elsif(lista_ord[lista_ord.size-1]<=y)
    		lista_ord.push(x)
    		break
  	      end
  	    end
  	    i +=1
          end
       return lista_ord
end
                 	
     

 def position(pos)
	if @head.nil?
	puts "La lista esta vacia"
	end
	contador=0
	copia=@head
	while contador<pos && !copia.nil?
		copia2= copia[:next]
		copia=copia2
		contador +=1
	end
	return copia[:value]
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

   def clasf_hidratos

   lista=[]

   current_node=@head
   while(!current_node.nil?)
	lista.append(current_node.value.hidratos)
	current_node=current_node.next
   end
   return lista
  end
  
  def clasf_peso
	
   lista=[]
   current_node=@head
   while(!current_node.nil?)
	lista.append(current_node.value.data.cadera)
	current_node=current_node.next
   end
   return lista
  end
end
