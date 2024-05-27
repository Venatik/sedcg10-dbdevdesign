import { PartialType } from '@nestjs/swagger';
import { CreateArtistDetailDto } from './create-artist-detail.dto';

export class UpdateArtistDetailDto extends PartialType(CreateArtistDetailDto) {}
