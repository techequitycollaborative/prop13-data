from sqlalchemy import create_engine, URL


class DBConnectionSetup:
    def __init__(self, db_username="postgres", db_password="", is_test=True):
        self.db_username = db_username
        self.db_password = db_password
        self.is_test = is_test

    def get_db_url(self):
        if self.is_test:
            return "localhost:5432"
        else:
            return "db-postgresql-sfo3-31638-do-user-10710390-0.b.db.ondigitalocean.com:25060"

    def get_engine(self):
        database_name = "Prop13Data" if self.is_test else "estimation"
        db_string = f'postgresql+psycopg2://{self.db_username}:{self.db_password}@{self.get_db_url()}/{database_name}'
        return create_engine(db_string, echo=False)