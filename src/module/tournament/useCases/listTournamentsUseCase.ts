import { Tournaments } from "@prisma/client";
import ITouramentRepository from "../repository/ITournamentRepository";

export default class ListTournamentUseCase {
  constructor(private readonly tournamentRepository: ITouramentRepository) {}
  async execute(): Promise<Tournaments[]> {
    const torunaments = this.tournamentRepository.list();
    return torunaments;
  }
}
