class Password
  #atributos
  attr_accessor :longitud, :contrasenya

  #constructor por defecto
 # def initialize ()
  #  self.longitud = 8
   # generar_password
  #end

  def initialize (longitud = 8)
    self.longitud = longitud
    generar_password
  end

  def generar_password
    #se crea la variable caracteres con los 3 rangos especificados en el pseudocodigo:
    #caracteres de la "a" a la "z" en minusculas y mayusculas : de la "A" a la "Z";
    #caracteres del 0 al 9;
    #se usa el ".map" para usar el metodo "to_a" para convertir cada rango en un array lo que resulta en
    #un array multidimensional
    #el metodo ".flatten" se usa para que se junten los 3 arrays en uno solo
    caracteres = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten

    #"(0...longitud)" equivale a decir que el rango de caracteres de contrasenya ira desde "0" hasta el
    #valor "de longitud-1"
    #".map" sirve para iterar sobre cada elemento del rango "(0...longitud)" y por cada iteracion
    #ejecuta "{caracteres.sample}" que elegirá un valor aleatorio del array caracteres y se lo pondrá en
    #la posicion de iteracion en la que este .map;
    #.join se encarga de que todos los valores que tenga contrasenya se unan y formen un unico string

    #self.contrasenya = (0...self.longitud).map { caracteres.sample }.join

    #otra forma un poco mas simple es usando array.new que crea un array vacio con el tamaño asignado por
    #self.longitud
    #la diferencia es que  ".map" evaluara cada posicion del array y ejecutara el metodo mientras que
    #"array,new" tomara el array y lo evaluara el array como si fuera un bloque por lo cual solo lo
    #evalua una vez y se ejecuta para todos el mismo metodo
    self.contrasenya = Array.new(self.longitud) { caracteres.sample }.join
  end

  #metodo para saber si el password es fuerte o no
  def es_fuerte
    contar_mayusculas > 2 && contar_minusculas > 1 && contar_numeros > 5
  end

  #metodos set and get
  def get_contrasenya
    contrasenya
  end

  def get_longitud
    longitud
  end

  def set_longitud(nueva_longitud)
    self.longitud = nueva_longitud
    generar_password
  end

  #metodos de conteo privados
  private
  #se usa el scan para buscar todos los caracteres que coincidan con el rango que has elegido en este caso:
  #"/[A-Z]/"
  #el metodo scan te devuelve un array
  #por esa reazon se usa size para que nos devuelva solo el tamaño del array
  def contar_mayusculas
    self.contrasenya.scan(/[A-Z]/).size
  end

  def contar_minusculas
    self.contrasenya.scan(/[a-z]/).size
  end

  def contar_numeros
    self.contrasenya.scan(/[0-9]/).size
  end
end

p1 = Password.new()
p2 = Password.new(100)

puts p1.get_contrasenya
puts p2.get_contrasenya

puts p1.es_fuerte
puts p2.es_fuerte
