//block class
class Block {
    PVector pos, dim;
    int r,g,b;
    Block(PVector pos, PVector dim, int r, int g, int b) {
        this.pos = pos;
        this.dim = dim;
        this.r = r;
        this.g = g;
        this.b = b;
    }
    boolean isOn(Player p) {
        if (abs(p.pos.x - pos.x) < p.cWidth.x / 2 + dim.x / 2) {
            return true;
        }
        return false;
    }
    boolean check(Player p) {
        if (abs(p.pos.x - pos.x) < p.cWidth.x / 2 + dim.x / 2 &&
            abs(p.pos.y - pos.y) < p.cWidth.y / 2 + dim.y / 2) {
            return true;
        }
        return false;
    }
    void drawMe() {
        pushMatrix();
        translate(pos.x, pos.y);
        noStroke();
        fill(r,g,b);
        rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
        popMatrix();
    }
}
