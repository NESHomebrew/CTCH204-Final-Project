////////////////////////////////////////////
///
///    polyPoint() function
///
///    This function is the meat and potatoes of the collision detection.
///    I fully credit: http://www.jeffreythompson.org/collision-detection/poly-point.php
///
///    It's a really great online book that had the exact method of collision detection
///    I needed. It can detect any point inside of a polygon. In my case, the polygon is
///    created using the four verticies, and the points are the little people.
///
////////////////////////////////////////////

  boolean polyPoint(ArrayList<PVector> vertices, float px, float py) {
    boolean collision = false;

    // go through each of the vertices, plus
    // the next vertex in the list
    int next = 0;
    for (int current=0; current<vertices.size(); current++) {

      // get next vertex in list
      // if we've hit the end, wrap around to 0
      next = current+1;
      if (next == vertices.size()) next = 0;

      // get the PVectors at our current position
      // this makes our if statement a little cleaner
      PVector vc = vertices.get(current);    // c for "current"
      PVector vn = vertices.get(next);       // n for "next"

      // compare position, flip 'collision' variable
      // back and forth
      if (((vc.y >= py && vn.y < py) || (vc.y < py && vn.y >= py)) &&
          (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
              collision = !collision;
      }
    }
    return collision;
  }