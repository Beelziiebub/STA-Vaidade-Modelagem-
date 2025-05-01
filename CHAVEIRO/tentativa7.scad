$fn = 100;

extrude_thickness = 3.0;
lift_height = 3.5;
coroa_lift = 2.9; // Afundada 0.1 mm na base para grudar bem

module base_chaveiro() {
    color("pink")
    cylinder(h = 3, r = 50);

    translate([0, 0, 2.98])  // ligeiramente abaixo para evitar sobreposição
    color("white")
    cylinder(h = 1.52, r = 48);
}

module texto_sta_vaidade() {
    color("black") {
        translate([-30, -10, lift_height + 0.1])
        linear_extrude(height = extrude_thickness)
        text("Sta", size = 10, font = "Arial:style=Bold");

        translate([-35, -25, lift_height + 0.1])
        linear_extrude(height = extrude_thickness)
        text("Vaidade", size = 10, font = "Arial:style=Bold");
    }
}

module silhueta_feminina() {
    color("black")
    translate([-60, -45, lift_height])
    linear_extrude(height = extrude_thickness)
    offset(r = 0.2)
    import("silhueta_mulher.dxf", convexity = 12);
}

module coroa() {
    translate([-70, -34, coroa_lift])
    color("gold")
    linear_extrude(height = extrude_thickness)
    import("coroa.dxf");
}

difference() {
    union() {
        base_chaveiro();
        silhueta_feminina();
        texto_sta_vaidade();
        coroa();
    }

    translate([0, 40, -1])
    cylinder(h = 8, r = 6);  // Furo ajustado
}
