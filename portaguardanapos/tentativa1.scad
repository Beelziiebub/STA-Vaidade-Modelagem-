// Porta-Guardanapos Estilo Simples - sem texto
// Inspirado no modelo de PLAPadawan

// Parâmetros
largura = 200;       // Largura interna
profundidade = 60;   // Profundidade
altura = 80;         // Altura das laterais
espessura = 3;       // Espessura das paredes

// Base
cube([largura + 2*espessura, profundidade, espessura]);

// Função para criar as laterais lisas
module lateral_lisa() {
    cube([largura, espessura, altura]);
}

// Lado esquerdo
translate([espessura, 0, espessura])
    lateral_lisa();

// Lado direito
translate([espessura, profundidade - espessura, espessura])
    mirror([0, 1, 0])
        lateral_lisa();
