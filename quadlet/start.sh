#!/bin/bash

# Layer 1: Network
echo_info "Starting network..."
sudo systemctl start frappe_network.service

# Layer 2: Database and Redis services
echo_info "Starting database and redis services..."
sudo systemctl start db.service redis-cache.service redis-queue.service

# Layer 3: Configurator, Backend, and Websocket
echo_info "Starting configurator, backend, and websocket..."
sudo systemctl start configurator.service

sudo systemctl start backend.service websocket.service

# Layer 4: Create site (if not already created)
echo_info "Starting create-site..."
sudo systemctl start create-site.service

# Layer 5: Scheduler, Queue workers, and Frontend
echo_info "Starting scheduler, queue workers, and frontend..."
sudo systemctl start scheduler.service queue-short.service queue-long.service frontend.service
