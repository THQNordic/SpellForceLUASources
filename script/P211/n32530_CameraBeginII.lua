-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 405.369202 , 326.090485 , 35.431072 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.188,257.638,21.990);]] )
   Camera:MotionSpline_AddSplinePoint( 405.259583 , 315.678040 , 35.431072 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.028717 , 293.747711 , 35.431072 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 404.938354 , 285.163055 , 35.431072 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.995,290.577,25.196);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
