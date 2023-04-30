import { Tournaments } from "@prisma/client";
import ICreateTournamentDTO from "../dtos/ICreateTournamentDTO";

interface ITouramentRepository {
  create(tournament: ICreateTournamentDTO): Promise<Tournaments>;
  list(): Promise<Tournaments[]>;
}

export default ITouramentRepository;
