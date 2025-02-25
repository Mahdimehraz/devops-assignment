## 🌐 Using a Custom Domain

1. **Configure your DNS records**:
   - Add an **A record** pointing to your server's IP address.
   - Example:

| Type | Name            | Value          |
|------|-----------------|----------------|
| A    | @ (root domain) | 192.168.1.100  |
| A    | www             | 192.168.1.100  |

2. **Update Nginx config**:
   Change the `server_name` value in `nginx.conf` to your domain:

   ```nginx
   server_name yourdomain.com www.yourdomain.com;
   ```

## 🔒 Enabling HTTPS with Certbot (Let's Encrypt)

1. **Install Certbot**:

   ```bash
   sudo apt update
   sudo apt install certbot python3-certbot-nginx
   ```

2. **Obtain an SSL certificate**:

   Run Certbot for Nginx:

   ```bash
   sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
   ```

3. **Verify auto-renewal**:

   Check that Certbot's auto-renewal service is active:

   ```bash
   sudo systemctl status certbot.timer
   ```

4. **Test renewal process**:

   ```bash
   sudo certbot renew --dry-run
   ```

After this, Nginx will automatically redirect HTTP traffic to HTTPS.

## ✅ Testing and Deployment

- Make sure your Docker Compose setup is running:

```bash
docker-compose up -d --build
```

- Visit your domain to check if everything works:

👉 https://yourdomain.com

---
