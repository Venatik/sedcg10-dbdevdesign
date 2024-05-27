import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ArtistDetailsService } from './artist-details.service';
import { CreateArtistDetailDto } from './dto/artist-details-query.dto';
import { UpdateArtistDetailDto } from './dto/update-artist-detail.dto';

@Controller('artist-details')
export class ArtistDetailsController {
  constructor(private readonly artistDetailsService: ArtistDetailsService) {}

  @Post()
  create(@Body() createArtistDetailDto: CreateArtistDetailDto) {
    return this.artistDetailsService.create(createArtistDetailDto);
  }

  @Get()
  findAll() {
    return this.artistDetailsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.artistDetailsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateArtistDetailDto: UpdateArtistDetailDto) {
    return this.artistDetailsService.update(+id, updateArtistDetailDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.artistDetailsService.remove(+id);
  }
}
