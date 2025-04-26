# E-Commerce Mobile App with Node.js Backend

A full-stack e-commerce application built with Flutter for the frontend and Node.js/Express for the backend.

# Admin login : 
email : leo@gmail.com
password: 1234567

## Project Structure

```
.
├── lib/                 # Flutter app source code
├── server/             # Node.js backend server
│   ├── models/         # MongoDB models
│   ├── routes/         # API routes
│   ├── middlewares/    # Express middlewares
│   └── index.js        # Server entry point
├── assets/             # Flutter assets
│   ├── images/         # App images
│   └── icons/          # App icons
└── render.yaml         # Render deployment configuration
```

## Features

### Frontend (Flutter)

- Modern and responsive UI
- Product listing and details
- Shopping cart functionality
- User authentication
- Payment integration
- Order tracking
- Product ratings and reviews

### Backend (Node.js)

- RESTful API
- User authentication and authorization
- Product management
- Order processing
- MongoDB database integration
- Secure payment handling

## Prerequisites

- Flutter SDK (latest version)
- Node.js (v18 or higher)
- MongoDB Atlas account
- Android Studio / Xcode (for mobile development)
- VS Code (recommended IDE)

## Setup Instructions

### Backend Setup

1. Navigate to the server directory:

   ```bash
   cd server
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Create a `.env` file in the server directory with the following variables:

   ```
   MONGODB_URI=your_mongodb_connection_string
   PORT=3000
   NODE_ENV=development
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

### Frontend Setup

1. Install Flutter dependencies:

   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Deployment

The backend is configured for deployment on Render. The `render.yaml` file contains the necessary configuration.

### Environment Variables for Production

Set these in your Render dashboard:

- `MONGODB_URI`: Your MongoDB connection string
- `NODE_ENV`: production
- `PORT`: 10000 (or as assigned by Render)

## API Endpoints

### Authentication

- `POST /api/auth/signup` - User registration
- `POST /api/auth/signin` - User login

### Products

- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product details
- `POST /api/products` - Create new product (admin only)
- `PUT /api/products/:id` - Update product (admin only)
- `DELETE /api/products/:id` - Delete product (admin only)

### User

- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update user profile
- `GET /api/user/orders` - Get user orders

### Admin

- `GET /api/admin/orders` - Get all orders
- `PUT /api/admin/orders/:id` - Update order status
- `GET /api/admin/users` - Get all users

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the ISC License.

## Support

For support, please open an issue in the GitHub repository or contact the maintainers.
