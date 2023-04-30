import { Tournaments } from "@prisma/client";
import ICreateTournamentDTO from "../dtos/ICreateTournamentDTO";
import ITouramentRepository from "../repository/ITournamentRepository";

export default class CreateTournamentUseCase {
  constructor(private tournamentRepository: ITouramentRepository) {}
  async execute(
    tournament: ICreateTournamentDTO
  ): Promise<Tournaments | undefined> {
    const tournamentCreated = await this.tournamentRepository.create(
      tournament
    );
    if (tournamentCreated) {
      return tournamentCreated;
    } else {
      return undefined;
    }
  }
}
