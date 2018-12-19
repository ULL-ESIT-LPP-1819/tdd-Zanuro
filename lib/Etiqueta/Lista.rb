require "Etiqueta/version"
Node = Struct.new(:value, :next, :prev)

class ListaDoble
  include Comparable,Enumerable

  attr_accessor :head, :tail, :length

  def initialize(length)
    @head = nil
    @tail = nil
    @length = length
  end
  
 # def <=>(otro)
  #    @head.value <=> otro.head.value
  #end	
  def each
      a = @head
      while(!a.nil?)
      yield a.value
      a=a.next
      end
  end
 
 def ordenar_con_for
    @temp = self.map{|x| x.gasto_energetico_total.round(2)}
    lista_ordenada=[]
    lista_ordenada.push(@temp[0])
    for i in (1..@length-1)
	a=@temp[i]
	for j in (0..i)
	    if(lista_ordenada[j]>=a)
		lista_ordenada.insert(j,a)
	        break
	    elsif(lista_ordenada[lista_ordenada.size-1] <= a)
	  	lista_ordenada.push(a)
		break
	    end
	end
     end
   return lista_ordenada 
    	
end

def ordenar_con_each
        
        @temp  = self.map{ |x| x.gasto_energetico_total.round(2)}

	i=0
	@temp.each do |x|
            a=x
            i1=i
	    j=i1+1
  	    @temp[j..@temp.length-1].each do |y|  
  	      if a > y
    		 a = y
    		 i1 = j
              end
              j+=1
  	      end
  	    @temp[i1]=x
            @temp[i]=a
	    i+=1
          end
      @temp
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
   def print
    current_node = @head
    while !(current_node.nil?)
      puts current_node.value.nombre_etiqueta.to_s
      current_node = current_node.next
    end
   end
end
