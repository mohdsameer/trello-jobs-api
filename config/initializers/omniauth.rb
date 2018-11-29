Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :trello, "7c5120fa7dff62773d68f270e3c97d15", "8bf8ad4ed81a0591091334be9840f1b2c09f3724204bc1447f1d59e1484dc080", 
    app_name: "adwareuser", scope: 'read,write,account', 
    expiration: 'never'
end 
