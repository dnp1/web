import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'dart:typed_data';
import 'package:angular/core.dart';


class Dimension {
  final int width, height;

  const Dimension(this.width, this.height);
}

@Injectable()
class ImageEditor {
  Future<File> fileFromDataURI(String dataURI, String filename) async {
    var mime = mimeTypeFromDataUrl(dataURI);
    var data = bytesFromDataUrl(dataURI);
    return new File([data], filename, {'type': mime});
  }

  Future<String> dataURIFromFile(File file) async {
    var reader = new FileReader();
    reader.readAsDataUrl(file);
    await reader.onLoadEnd.first;

    return reader.result;
  }

  // ignore: ambiguous_import
  Future<File> resizeImageFile(final File file,
      final int maxWidth,
      final int maxHeight,
      [bool ensureRation = false]) async {
    var sourceDataURI = await dataURIFromFile(file);
    var dataURI = await resizeImageDataUrl(
        sourceDataURI, maxWidth, maxHeight, ensureRation);

    return fileFromDataURI(dataURI, file.name);
  }


  Dimension getDimensions(final int width, final int height, final int maxWidth,
      final int maxHeight) {
    double w = width.toDouble();
    double h = height.toDouble();
    final double _maxHeight = maxHeight.toDouble();
    final double _maxWidth = maxWidth.toDouble();

    if (width > height) {
      if (width > maxWidth) {
        h *= _maxWidth / w;
        w = _maxWidth;
      }
    } else {
      if (height > maxHeight) {
        w *= _maxHeight / h;
        h = _maxHeight;
      }
    }
    return new Dimension(w.toInt(), h.toInt());
  }

  Future<String> resizeImageDataUrl(String dataURI,
      final int maxWidth,
      final int maxHeight,
      [bool ensureRatio = null]) async {
    var mime = mimeTypeFromDataUrl(dataURI);
    ImageElement img = document.createElement("img");
    img.src = dataURI;
    await img.onLoad.first;
    CanvasElement canvas = document.createElement('canvas');
    CanvasRenderingContext2D ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0);
    Dimension dim;
    if (ensureRatio) {
      dim = new Dimension(maxWidth, maxHeight);
    } else {
      dim = getDimensions(img.width, img.height, maxWidth, maxHeight);
    }

    canvas.width = dim.width;
    canvas.height = dim.height;
    ctx = canvas.getContext("2d");
    ctx.drawImageScaled(img, 0, 0, dim.width, dim.height);
    img.remove();

    return canvas.toDataUrl(mime, .7);
  }

  String mimeTypeFromDataUrl(String dataURI) =>
      dataURI.split(',')[0].split(':')[1].split(';')[0];

  List<int> bytesFromDataUrl(String dataURI) =>
      BASE64.decode(dataURI.split(',')[1]);

}