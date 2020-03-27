import 'dart:math';

class PRNG {
  PRNG(this.seed);
  var seed;
  int M = 4294967296;
  int A = 1664525;
  int C = 1;
  
  double randomize() {
    seed = (A * seed + C) % M;
    return seed / M;
  }
}

List generatePerlinNoise1D(amp, wl, octaves, divisor, width, seed) {
  double interpolate(pa, pb, px) {
    double ft = px * pi;
    double f = (1 - cos(ft)) * 0.5;
    return pa * (1 - f) + pb * f;
  }

  List generateSinglePerlin(amp, wl, width, seed) {
    var prng = PRNG(seed);
    double a = prng.randomize();
    double b = prng.randomize();
    List pos = [];

    for (var x = 0; x < width; x++) {
      if (x % wl == 0) {
        a = b;
        b = prng.randomize();
        pos.add(a * amp);
      } else {
        pos.add(interpolate(a, b, (x % wl) / wl) * amp);
      }
    }
    
    return pos;
  }

  List generateNoise(amp, wl, octaves, divisor, width, seed) {
    List result = [];
    for (int i = 0; i < octaves; i++) {
      result.add(generateSinglePerlin(amp, wl, width, seed));
      amp /= divisor;
      wl /= divisor;
    }
    return result;
  }

  List combineNoise(pl) {
    List result = [];
    for (int i = 0, j = 0; i < pl[0].length; i++) {
      double total = 0.0;
      for (j = 0; j < pl.length; j++) {
        total += pl[j][i];
      }
      result.add(total);
    }
    return result;
  }

  return combineNoise(generateNoise(amp, wl, octaves, divisor, width, seed));
}
