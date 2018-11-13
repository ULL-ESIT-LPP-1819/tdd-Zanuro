Node = Struct.new(:value,:next,:prev)

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
  def add_at_final(nodo)
    if @tail.nil?
      @tail = nodo
      @length+=1
    else
      @tail.next = nodo
      nodo.prev = @tail
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

  def extraer_begin
    if @head.nil?
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
  def extraer_end
    if @tail.nil?
      return nil
    else
      current_node = @tail
      @tail = @tail.prev
      @tail.next = nil
      current_node.prev = nil
      @length-=1
      return current_node
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
        if current_node.data == nodo1.data
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
    if current_node.data == nodo.data
      @head = @head.next
      @head.prev(nil)
      current_node.next(nil)
      return current_node
    else
      while current_node != nil
        current_node = current_node.next
        if current_node.data == nodo.data
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
    while current_node != nil
      p current_node.data
      current_node = current_node.next
    end
    p current_node.data
  end

end
