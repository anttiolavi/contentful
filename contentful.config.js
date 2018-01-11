require('dotenv').config();

module.exports = {
    access_token: process.env.CONTENTFUL_ACCESS_TOKEN,
    space_id: process.env.CONTENTFUL_SPACE_ID,
    content_types: {
        pages: {
            id: 'page',
            path: (e) => `page/${e.sys.id}`,
            template: 'views/_page.jade',
            transform: (e) => JSON.parse(JSON.stringify(e))
        }
    }
};
