# Upload Image Project

This is a Flutter project that allows users to pick an image from their device's gallery and upload it to a server.

## Features

- Pick an image from the gallery using the `image_picker` package.
- Display a preview of the selected image.
- Upload the image to a server using the `http` package.
- Show a loading spinner while the image is being uploaded using the `modal_progress_hud_nsn` package.

## Project Structure

```
lib/
├── main.dart # Entry point of the application
├── upload_image.dart # Contains the UI and logic for image upload
```

## Dependencies

The project uses the following dependencies:

- [image_picker](https://pub.dev/packages/image_picker): For selecting images from the gallery.
- [http](https://pub.dev/packages/http): For making HTTP requests.
- [modal_progress_hud_nsn](https://pub.dev/packages/modal_progress_hud_nsn): For showing a loading spinner.

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd upload_image_project
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Permissions

Ensure the following permissions are added to the `AndroidManifest.xml` file for Android:

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.CAMERA" />
```

For iOS, update the `Info.plist` file with the following keys:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to upload images.</string>
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take photos.</string>
```

## How to Use

1. Tap on the **"Pick Image"** button to select an image from the gallery.
2. After selecting an image, a preview will be displayed.
3. Tap on the **"Upload"** button to upload the image to the server.

## API Endpoint

The app uploads images to the following endpoint:

```
https://fakestoreapi.com/products
```

## Screenshots

| Pick Image Screen | Uploading Spinner |
|------------------|------------------|
| ![Pick Image](screenshot1.png) | ![Uploading Spinner](screenshot2.png) |

## License

This project is licensed under the MIT License. See the LICENSE file for details.

